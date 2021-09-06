import 'dart:convert';

import 'package:charted/utils/user_prefs.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class UserDetails with ChangeNotifier {
  double _balance = 0;
  String _id = '';
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _username = '';
  String _fundAccountID = '';
  String _createdAt = '';

  void getUserData() async {
    //Send request to get data
    final String _token = UserPreferences.getToken() ?? '';

    try {
      http.Response _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/auth'),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        Map<String, dynamic> _data =
            json.decode(_response.body) as Map<String, dynamic>;

        this._name = _data['name'];
        this._email = _data['email'];
        this._id = _data['_id'];
        this._username = _data['username'];
        this._balance = _data['coins'].toDouble();
        this._phoneNumber = _data['phoneNumber'];
        this._fundAccountID =
            _data['fundAccountID'] == null ? '' : _data['fundAccountID'];
        this._createdAt = _data['createdAt'];
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void withdraw(double _amount) async {
    print('Withdrawing now');
    final String _token = UserPreferences.getToken() ?? '';
    try {
      http.Response _response = await http.post(
        Uri.parse(
            'https://charted-server.herokuapp.com/api/transactions/withdraw'),
        headers: {
          'x-auth-token': _token,
          'Content-Type': 'application/json',
        },
        body: json.encode({'amount': _amount}),
      );

      print(_response.body);

      if (_response.statusCode == 200) {
        this._balance -= _amount;
        notifyListeners();
      }
    } on Exception catch (e) {}
  }

  void addMoney(double amount) {
    this._balance += amount;
    notifyListeners();
  }

  void spendMoney(double amount) {
    this._balance -= amount;
    notifyListeners();
  }

  //Getters
  String get id => this._id;

  String get name => this._name;

  String get email => this._email;

  String get phoneNumber => this._phoneNumber;

  String get username => this._username;

  double get balance => this._balance;

  String get createdAt => this._createdAt;

  String get fundAccountId => this._fundAccountID;
}
