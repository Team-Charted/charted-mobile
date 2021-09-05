import 'package:flutter/material.dart';

class UserDetails with ChangeNotifier {
  double balance = 0;
  String id = '';
  String name = '';
  String email = '';
  String phoneNumber = '';
  String username = '';
  String fundAccountID = '';
  String createdAt = '';

  UserDetails(
      //getUserData()
      );

  void getUserData() {
    //Send request to get data
  }

  void addMoney(double amount) {
    balance += amount;
    notifyListeners();
  }

  void spendMoney(double amount) {
    balance -= amount;
    notifyListeners();
  }

  //Decoding json object
  UserDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        username = json['username'],
        id = json['_id'],
        balance = json['coins'].toDouble(),
        phoneNumber = json['phoneNumber'],
        fundAccountID =
            json['fundAccountID'] == null ? '' : json['fundAccountID'],
        createdAt = json['createdAt'];
}
