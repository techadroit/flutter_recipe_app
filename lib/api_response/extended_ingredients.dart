import 'measures.dart';

class ExtendedIngredients {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalString;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  List<String>? metaInformation;
  Measures? measures;

  ExtendedIngredients({
      this.id, 
      this.aisle, 
      this.image, 
      this.consistency, 
      this.name, 
      this.nameClean, 
      this.original, 
      this.originalString, 
      this.originalName, 
      this.amount, 
      this.unit, 
      this.meta, 
      this.metaInformation, 
      this.measures});

  ExtendedIngredients.fromJson(dynamic json) {
    id = json["id"];
    aisle = json["aisle"];
    image = json["image"];
    consistency = json["consistency"];
    name = json["name"];
    nameClean = json["nameClean"];
    original = json["original"];
    originalString = json["originalString"];
    originalName = json["originalName"];
    amount = json["amount"];
    unit = json["unit"];
    meta = json["meta"] != null ? json["meta"].cast<String>() : [];
    metaInformation = json["metaInformation"] != null ? json["metaInformation"].cast<String>() : [];
    measures = json["measures"] != null ? Measures.fromJson(json["measures"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["aisle"] = aisle;
    map["image"] = image;
    map["consistency"] = consistency;
    map["name"] = name;
    map["nameClean"] = nameClean;
    map["original"] = original;
    map["originalString"] = originalString;
    map["originalName"] = originalName;
    map["amount"] = amount;
    map["unit"] = unit;
    map["meta"] = meta;
    map["metaInformation"] = metaInformation;
    if (measures != null) {
      map["measures"] = measures?.toJson();
    }
    return map;
  }

}