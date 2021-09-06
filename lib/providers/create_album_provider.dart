import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          if (e['leadSingle']) {
            this.leadIndex = (_data['songs'] as List).indexOf(e);
            e['leadSingle'] = false;
          }
          return Song.fromJson(e);
        }).toList();

        selectedSongs = []..addAll(_songs);
        notifyListeners();
      } else {
        print(_response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void createAlbum(String _id, BuildContext context) async {
    if (selectedSongs.isEmpty) {
      showSnackbar(
          context, 'Album can\'t  be empty', Theme.of(context).accentColor);
      return;
    }
    //Set lead artist
    selectedSongs[leadIndex].setLeadSingle();

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
        Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute(
              HomeScreen(),
            ),
            (route) => false);
        showSnackbar(context, 'Album saved', Theme.of(context).accentColor);
      } else if (_response.statusCode == 400) {
        final _data = json.decode(_response.body) as Map;
        final _errors = _data['errors'] as List;
        final _error = _errors[0] as Map;
        showSnackbar(context, _error['msg'], Theme.of(context).accentColor);
      } else {
        print(_response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
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
          showSnackbar(
              context, 'No results found', Theme.of(context).accentColor);
        }

        searchResults = []..addAll(_data);
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void addSong(Song song, BuildContext context) {
    if (selectedSongs.contains(song)) {
      showSnackbar(
          context, 'Song is already added', Theme.of(context).accentColor);
      searchResults.remove(song);
      return;
    } else if (song.value > credits) {
      showSnackbar(
          context, 'Not enough credits', Theme.of(context).accentColor);
      return;
    } else if (selectedSongs.length >= 9) {
      showSnackbar(
        context,
        'Can\'t select more than 9 songs',
        Theme.of(context).accentColor,
      );
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

  void showSnackbar(BuildContext _context, String _content, Color _bgColor) {
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();
    final _snackBar = SnackBar(
      content: Text(
        _content,
        style: GoogleFonts.inter(
          fontSize: 13,
          color: Colors.white,
        ),
      ),
      backgroundColor: _bgColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // action: SnackBarAction(
      //   label: 'Okay',
      //   textColor: Colors.white,
      //   onPressed: () => ScaffoldMessenger.of(_context).hideCurrentSnackBar(),
      // ),
    );
    ScaffoldMessenger.of(_context).showSnackBar(_snackBar);
  }
}
