/*
{
    "coins": 0,
    "_id": "6107443c47a69b3880356598",
    "name": "John Doe",
    "email": "example@gmail.com",
    "phoneNumber": "9810157693",
    "username": "my_username",
		"fundAccountID": "xxxxxxxxxxxxxxxx",
    "createdAt": "1627225104828",
    "__v": 0
}
*/
class UserDetails {
  final double balance;
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String username;
  final String fundAccountID;
  final String createdAt;

  UserDetails({
    required this.id,
    required this.balance,
    required this.name,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.fundAccountID,
    required this.createdAt,
  });

  //Getters
  String getId() => id;

  double getBalance() => balance;

  String getName() => name;

  String getEmail() => email;

  String getUsername() => username;

  String getPhoneNumber() => phoneNumber;

  String getFundAccountId() => fundAccountID;

  String getCreatedAt() => createdAt;

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
