class Us {
  double? amount;
  String? unitShort;
  String? unitLong;

  Us({
      this.amount, 
      this.unitShort, 
      this.unitLong});

  Us.fromJson(dynamic json) {
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