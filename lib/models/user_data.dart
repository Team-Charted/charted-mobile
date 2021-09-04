/*
{
    "name": "John Doe",
    "email": "example@gmail.com",
    "username": "my_username",
    "password": "123456",
    "phoneNumber": "9810157693"
}
*/
class UserData {
  final String name;
  final String email;
  final String username;
  final String password;
  final String phoneNumber;

  UserData(
      this.name, this.email, this.username, this.password, this.phoneNumber);

  //Getters
  String getName() => this.name;

  String getEmail() => this.email;

  String getUsername() => this.username;

  String getPassword() => this.password;

  String getPhoneNumber() => this.phoneNumber;

  //Decoding json object
  UserData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        username = json['username'],
        password = json['password'],
        phoneNumber = json['phoneNumber'];

  //Encoding json
  Map<String, dynamic> toJson() {
    return {
      'name': getName(),
      'email': getEmail(),
      'username': getUsername(),
      'password': getPassword(),
      'phoneNumber': getPhoneNumber()
    };
  }
}
