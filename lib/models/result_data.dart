import 'package:charted/models/chart_data.dart';
import 'package:charted/models/result_chart.dart';

class Result {
  /*
  {
        "_id": "611ed0d18fafe12e9c6e3942",
        "chart": {
            "_id": "6111311849009b0df46203ae",
            "name": "Billboard Hot 100",
            "prizePool": 10000,
            "cost": 25,
            "type": "Weekly"
        },
        "date": "2021-08-21",
        "calculatedAt": "2021-08-19T21:44:49.451Z",
        "__v": 0
    },
  */
  final String id;
  final ResultChart chart;
  final String date;
  final String calculatedAt;
  final double _v;

  Result(this.id, this.chart, this.date, this.calculatedAt, this._v);

  //Getters
  String getId() => id;

  ResultChart getChart() => chart;

  String getDate() => date;

  double get_v() => _v;
}
