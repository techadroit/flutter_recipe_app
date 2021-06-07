import 'us.dart';
import 'metric.dart';

class Measures {
  Us? us;
  Metric? metric;

  Measures({
      this.us, 
      this.metric});

  Measures.fromJson(dynamic json) {
    us = json["us"] != null ? Us.fromJson(json["us"]) : null;
    metric = json["metric"] != null ? Metric.fromJson(json["metric"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (us != null) {
      map["us"] = us?.toJson();
    }
    if (metric != null) {
      map["metric"] = metric?.toJson();
    }
    return map;
  }

}