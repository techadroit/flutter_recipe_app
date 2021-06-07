/// id : 296687
/// title : "chicken"
/// imageType : "jpg"

class AutoCompleteResponse {
  int? _id;
  String? _title;
  String? _imageType;

  int? get id => _id;
  String? get title => _title;
  String? get imageType => _imageType;

  AutoCompleteResponse({
      int? id, 
      String? title, 
      String? imageType}){
    _id = id;
    _title = title;
    _imageType = imageType;
}

  AutoCompleteResponse.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _imageType = json["imageType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["imageType"] = _imageType;
    return map;
  }

}