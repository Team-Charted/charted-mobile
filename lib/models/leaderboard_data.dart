class LeaderboardData {
  /*
  {
            "_id": "612514b386e19f21c4301e86",
            "username": "mizanxali",
            "albumName": "My Amazing Album",
            "points": 1.1221532091097308
        }
  */

  final String _id;
  final String _username;
  final double _points;

  const LeaderboardData(
    this._id,
    this._username,
    this._points,
  );

  //Getters
  String getId() => _id;

  String getUsername() => _username;

  double getPoints() => _points;

  //Decoding json object
  LeaderboardData.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        _username = json['username'],
        _points = json['points'].toDouble();
}
