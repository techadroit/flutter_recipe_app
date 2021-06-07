/// totalResults : 1296
/// videos : [{"title":"Chicken Gyros","shortTitle":"Chicken Gyros","youTubeId":"dj0EpQMMbFI","rating":0.9881538461538462,"views":291139,"thumbnail":"https://i.ytimg.com/vi/dj0EpQMMbFI/mqdefault.jpg","length":115},{"title":"Chicken Stew","shortTitle":"Chicken Stew","youTubeId":"U89kUOGSXhs","rating":0.9554367201426025,"views":39006,"thumbnail":"https://i.ytimg.com/vi/U89kUOGSXhs/hqdefault.jpg","length":253},{"title":"Chicken Strips","shortTitle":"Chicken Strips","youTubeId":"Y0UBAhAS-wE","rating":0.9863945578231292,"views":16520,"thumbnail":"https://i.ytimg.com/vi/Y0UBAhAS-wE/mqdefault.jpg","length":293},{"title":"Chicken Milanese","shortTitle":"Chicken Milanese","youTubeId":"VWdvDfUGjPQ","rating":0.9849706744868035,"views":60059,"thumbnail":"https://i.ytimg.com/vi/VWdvDfUGjPQ/hqdefault.jpg","length":473},{"title":"Chicken Parm Bake","shortTitle":"Chicken Parm Bake","youTubeId":"l4BlOewfrac","rating":0.9852491834369402,"views":443446,"thumbnail":"https://i.ytimg.com/vi/l4BlOewfrac/mqdefault.jpg","length":84},{"title":"Chicken Parm Bites","shortTitle":"Chicken Parm Bites","youTubeId":"w2V2WvEs5e0","rating":0.9913400182315406,"views":253329,"thumbnail":"https://i.ytimg.com/vi/w2V2WvEs5e0/mqdefault.jpg","length":61},{"title":"Chicken Cordon Bleu","shortTitle":"Chicken Cordon Bleu","youTubeId":"gN9_kaEZh-4","rating":0.9861061631635197,"views":55302,"thumbnail":"https://i.ytimg.com/vi/gN9_kaEZh-4/hqdefault.jpg","length":212},{"title":"Chicken Tortilla Soup","shortTitle":"Chicken Tortilla Soup","youTubeId":"MNRCZ_057Po","rating":1.0,"views":628,"thumbnail":"https://i.ytimg.com/vi/MNRCZ_057Po/hqdefault.jpg","length":246},{"title":"Chicken Wings 7 Ways","shortTitle":"Chicken Wings 7 Ways","youTubeId":"D_YGIeVM3FE","rating":0.9885213398726912,"views":232434,"thumbnail":"https://i.ytimg.com/vi/D_YGIeVM3FE/mqdefault.jpg","length":318},{"title":"Chicken Parm Lasagna","shortTitle":"Chicken Parm Lasagna","youTubeId":"AFdgqJkAzGc","rating":0.9866906235442869,"views":648875,"thumbnail":"https://i.ytimg.com/vi/AFdgqJkAzGc/mqdefault.jpg","length":62}]

class SearchVideoRecipesResponse {
  int? _totalResults;
  List<Videos>? _videos;

  int? get totalResults => _totalResults;
  List<Videos>? get videos => _videos;

  SearchVideoRecipesResponse({
      int? totalResults, 
      List<Videos>? videos}){
    _totalResults = totalResults;
    _videos = videos;
}

  SearchVideoRecipesResponse.fromJson(dynamic json) {
    _totalResults = json["totalResults"];
    if (json["videos"] != null) {
      _videos = [];
      json["videos"].forEach((v) {
        _videos?.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["totalResults"] = _totalResults;
    if (_videos != null) {
      map["videos"] = _videos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Chicken Gyros"
/// shortTitle : "Chicken Gyros"
/// youTubeId : "dj0EpQMMbFI"
/// rating : 0.9881538461538462
/// views : 291139
/// thumbnail : "https://i.ytimg.com/vi/dj0EpQMMbFI/mqdefault.jpg"
/// length : 115

class Videos {
  String? _title;
  String? _shortTitle;
  String? _youTubeId;
  double? _rating;
  int? _views;
  String? _thumbnail;
  int? _length;

  String? get title => _title;
  String? get shortTitle => _shortTitle;
  String? get youTubeId => _youTubeId;
  double? get rating => _rating;
  int? get views => _views;
  String? get thumbnail => _thumbnail;
  int? get length => _length;

  Videos({
      String? title, 
      String? shortTitle, 
      String? youTubeId, 
      double? rating, 
      int? views, 
      String? thumbnail, 
      int? length}){
    _title = title;
    _shortTitle = shortTitle;
    _youTubeId = youTubeId;
    _rating = rating;
    _views = views;
    _thumbnail = thumbnail;
    _length = length;
}

  Videos.fromJson(dynamic json) {
    _title = json["title"];
    _shortTitle = json["shortTitle"];
    _youTubeId = json["youTubeId"];
    _rating = json["rating"];
    _views = json["views"];
    _thumbnail = json["thumbnail"];
    _length = json["length"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["shortTitle"] = _shortTitle;
    map["youTubeId"] = _youTubeId;
    map["rating"] = _rating;
    map["views"] = _views;
    map["thumbnail"] = _thumbnail;
    map["length"] = _length;
    return map;
  }

}