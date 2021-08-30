class ChartData {
  /*
  "_id": "60fbf744179c143ae0ea09d2",
        "name": "Billboard Hot 100",
				"cost": 50,
        "type": "Weekly",
        "date": "2021-07-12",
				"endTime": "1234567891234",
        "__v": 0
  */
  final String id;
  final String name;
  final double cost;
  final String type;
  final String date;
  final String endTime;
  final double _v;

  ChartData(this.id, this.name, this.cost, this.type, this.date, this.endTime,
      this._v);

  //Getters
  String getId() => id;

  String getName() => name;

  double getCost() => cost;

  String gettype() => type;

  String getDate() => date;

  String getEndTime() => endTime;

  double get_v() => _v;
}
