class ChartData {
  final String id;
  final String name;
  final double prizePool;
  final double cost;
  final String type;
  final String date;
  final String endTime;

  ChartData({
    required this.id,
    required this.name,
    required this.prizePool,
    required this.cost,
    required this.type,
    required this.date,
    required this.endTime,
  });

  //Getters
  String getId() => id;

  String getName() => name;

  double getPrizePool() => prizePool;

  double getCost() => cost;

  String getType() => type;

  String getDate() => date;

  String getEndTime() => endTime;

  //Decoding json object
  ChartData.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        prizePool = json['prizePool'].toDouble(),
        cost = json['cost'].toDouble(),
        type = json['type'],
        date = json['date'],
        endTime = json['endTime'];

  //Encoding json
  Map<String, dynamic> toJson() {
    return {
      '_id': getId(),
      'name': getName(),
      'prizePool': getPrizePool(),
      'cost': getCost(),
      'type': getType(),
      'date': getDate(),
      'endTime': getEndTime()
    };
  }
}
