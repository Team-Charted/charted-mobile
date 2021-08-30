class ResultChart {
  /*
  "chart": {
            "_id": "6111311849009b0df46203ae",
            "name": "Billboard Hot 100",
            "prizePool": 10000,
            "cost": 25,
            "type": "Weekly"
        },
  */
  final String id;
  final String name;
  final double prizePool;
  final double cost;
  final String type;

  ResultChart(this.id, this.name, this.prizePool, this.cost, this.type);

  //Getters
  String getId() => id;

  String getName() => name;

  double getprizePool() => prizePool;

  double getCost() => cost;

  String getType() => type;
}
