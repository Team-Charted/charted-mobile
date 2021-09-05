import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/song_data.dart';
import '../utils/user_prefs.dart';
import '../screens/home_screen.dart';
import '../widgets/custom_page_route.dart';

import 'package:http/http.dart' as http;

class CreateAlbum with ChangeNotifier {
  int leadIndex = 0;
  double credits = 75;

  List<Song> searchResults = [];
  List<Song> selectedSongs = [];

  void getAlbum(String _id) async {
    //Get album by chart id and populate the list
    final String _token = UserPreferences.getToken() ?? '';

    try {
      final _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/albums/' + _id),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        final _data = json.decode(_response.body) as Map;
        List<Song> _songs = (_data['songs'] as List).map((e) {
          this.credits -= e['credits'].toDouble();
          return Song.fromJson(e);
        }).toList();

        selectedSongs = []..addAll(_songs);
        notifyListeners();
      } else {
        print(_response.body);
      }
    } on Exception catch (e) {}
  }

  void createAlbum(String _id, BuildContext context) async {
    selectedSongs.map((e) => e.setLeadSingle(false));
    //Set lead artist
    selectedSongs[leadIndex].setLeadSingle(true);

    final String _token = UserPreferences.getToken() ?? '';

    try {
      final List _songs = selectedSongs.map((e) => e.toJson()).toList();

      final _response = await http.post(
          Uri.parse('https://charted-server.herokuapp.com/api/albums/' + _id),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': _token,
          },
          body: json.encode({'songs': _songs}));

      if (_response.statusCode == 200) {
        selectedSongs.clear();
        searchResults.clear();
        print(_response.body);
        notifyListeners();
        Navigator.of(context).pushReplacement(
          CustomPageRoute(
            HomeScreen(),
          ),
        );
        final snackBar = SnackBar(content: Text('Album Saved'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print(_response.body);
      }
    } on Exception catch (e) {}
  }

  void searchSongs(String keyword, BuildContext context) async {
    searchResults.clear();

    final String _token = UserPreferences.getToken() ?? '';

    try {
      final _response = await http.post(
        Uri.parse('https://charted-server.herokuapp.com/api/searches'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': _token,
        },
        body: jsonEncode(
          {'queryString': keyword},
        ),
      );

      if (_response.statusCode == 200) {
        List _body = json.decode(_response.body) as List;

        List<Song> _data = _body.map((e) {
          return Song.fromJson(e);
        }).toList();

        if (_data.isEmpty) {
          final snackBar = SnackBar(
            content: Text('No results found'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        searchResults = []..addAll(_data);
        notifyListeners();
      }
    } on Exception catch (e) {}
  }

  void addSong(Song song, BuildContext context) {
    if (selectedSongs.contains(song)) {
      final snackBar = SnackBar(
        content: Text('Song is already added'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      searchResults.remove(song);
      return;
    } else if (song.value > credits) {
      final snackBar = SnackBar(
        content: Text('Not enough credits'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (selectedSongs.length >= 9) {
      final snackBar = SnackBar(
        content: Text('Can\'t select more than 9 songs'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      selectedSongs.add(song);
      searchResults.remove(song);
      credits -= song.value;
      notifyListeners();
    }
  }

  void removeSong(Song song) {
    //If song with lead index is removed then we reset the lead index
    if (leadIndex == selectedSongs.indexOf(song)) {
      leadIndex = 0;
    }
    selectedSongs.remove(song);
    credits += song.value;
    notifyListeners();
  }

  void reorder(final oldIndex, final newIndex) {
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final Song song = selectedSongs[oldIndex];
    if (oldIndex == this.leadIndex) {
      leadIndex = index;
    }
    selectedSongs.removeAt(oldIndex);
    selectedSongs.insert(index, song);
    notifyListeners();
  }

  void changeLeadIndex(int index) {
    leadIndex = index;
    notifyListeners();
  }

  void resetCredits() {
    this.credits = 75;
  }
}
