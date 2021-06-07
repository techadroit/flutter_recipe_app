class Metric {
  double? amount;
  String? unitShort;
  String? unitLong;

  Metric({
      this.amount, 
      this.unitShort, 
      this.unitLong});

  Metric.fromJson(dynamic json) {
    amount = json["amount"];
    unitShort = json["unitShort"];
    unitLong = json["unitLong"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["amount"] = amount;
    map["unitShort"] = unitShort;
    map["unitLong"] = unitLong;
    return map;
  }

}