import '../models/chart_data.dart';

class ResultData {
  /*
  {
        "_id": "612514b386e19f21c4301e83",
        "chart": {
            "_id": "6111311849009b0df46203ae",
            "name": "Billboard Hot 100",
            "prizePool": 10000,
            "cost": 25,
            "type": "Weekly",
            "__v": 0,
            "date": "07/16/2021",
            "endTime": "1629321480536"
        },
        "date": "2021-08-28",
        "calculatedAt": "2021-08-24T15:48:03.271Z",
				"winnings": 10000,
        "__v": 0
    }
  */
  final String id;
  final ChartData chart;
  final String date;
  final String calculatedAt;
  final double winnings;

  ResultData({
    required this.id,
    required this.chart,
    required this.date,
    required this.calculatedAt,
    required this.winnings,
  });

  //Getters
  String getId() => id;

  ChartData getChart() => chart;

  String getDate() => date;

  String getCalculatedAt() => calculatedAt;

  double getWinnings() => winnings;

  //Decoding json object
  ResultData.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        chart = json['chart'],
        date = json['date'],
        calculatedAt = json['calculatedAt'],
        winnings = json['winnings'].toDouble();
}
