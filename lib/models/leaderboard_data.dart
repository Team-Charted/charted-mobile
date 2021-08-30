class LeaderboardData {
  final String _id;
  final String _username;
  final String _points;

  const LeaderboardData(
    this._id,
    this._username,
    this._points,
  );

  //Getters
  String getId() => _id;

  String getUsername() => _username;

  String getPoints() => _points;
}
