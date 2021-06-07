/// results : [{"id":629963,"title":"chilli chicken","author":"swasthi","readyInMinutes":160,"servings":2,"sourceUrl":"https://spoonacular.com/-1424528841847","openLicense":2,"image":"chilli-chicken-629963.jpg"},{"id":632810,"title":"Asian Chicken","readyInMinutes":45,"servings":4,"sourceUrl":"https://www.foodista.com/recipe/PP54PKNQ/asian-chicken","openLicense":2,"image":"Asian-Chicken-632810.jpg"},{"id":633959,"title":"Balti Chicken","readyInMinutes":45,"servings":5,"sourceUrl":"http://www.foodista.com/recipe/2JXFWGVT/balti-chicken","openLicense":2,"image":"Balti-Chicken-633959.jpg"},{"id":634476,"title":"Bbq Chicken","readyInMinutes":45,"servings":4,"sourceUrl":"http://www.foodista.com/recipe/4BXYSZ32/bbq-chicken","openLicense":2,"image":"Bbq-Chicken-634476.jpg"},{"id":637942,"title":"Chicken Arrozcaldo","readyInMinutes":45,"servings":9,"sourceUrl":"https://www.foodista.com/recipe/BJ4SQ56F/chicken-arrozcaldo","openLicense":2,"image":"Chicken-Arrozcaldo-637942.jpg"},{"id":637999,"title":"Chicken Burritos","readyInMinutes":45,"servings":4,"sourceUrl":"http://www.foodista.com/recipe/YCKK77YK/chicken-burrito-by-bing","openLicense":2,"image":"Chicken-Burrito-By-Bing-637999.jpg"},{"id":638002,"title":"Chicken Cacciatore","readyInMinutes":45,"servings":6,"sourceUrl":"https://www.foodista.com/recipe/7M55MLHY/chicken-cacciatore","openLicense":2,"image":"Chicken-Cacciatore-638002.jpg"},{"id":638086,"title":"Chicken Fingers","readyInMinutes":30,"servings":2,"sourceUrl":"http://www.foodista.com/recipe/6GVTWWJ6/chicken-fingers","openLicense":2,"image":"Chicken-Fingers-638086.jpg"},{"id":638125,"title":"Chicken In A Pot","readyInMinutes":45,"servings":4,"sourceUrl":"https://www.foodista.com/recipe/4FNL5JJ8/chicken-in-a-pot","openLicense":2,"image":"Chicken-In-A-Pot-638125.jpg"},{"id":638174,"title":"Chicken Lo Mein","readyInMinutes":45,"servings":2,"sourceUrl":"http://www.foodista.com/recipe/R6TCPBBF/chicken-lo-mein","openLicense":2,"image":"Chicken-Lo-Mein-638174.jpg"}]
/// baseUri : "https://spoonacular.com/recipeImages/"
/// offset : 1
/// number : 10
/// totalResults : 457
/// processingTimeMs : 199
/// expires : 1622971405073
/// isStale : false

class SearchRecipeResponse {
  List<Results>? _results;
  String? _baseUri;
  int? _offset;
  int? _number;
  int? _totalResults;
  int? _processingTimeMs;
  int? _expires;
  bool? _isStale;

  List<Results>? get results => _results;
  String? get baseUri => _baseUri;
  int? get offset => _offset;
  int? get number => _number;
  int? get totalResults => _totalResults;
  int? get processingTimeMs => _processingTimeMs;
  int? get expires => _expires;
  bool? get isStale => _isStale;

  SearchRecipeResponse({
      List<Results>? results, 
      String? baseUri, 
      int? offset, 
      int? number, 
      int? totalResults, 
      int? processingTimeMs, 
      int? expires, 
      bool? isStale}){
    _results = results;
    _baseUri = baseUri;
    _offset = offset;
    _number = number;
    _totalResults = totalResults;
    _processingTimeMs = processingTimeMs;
    _expires = expires;
    _isStale = isStale;
}

  SearchRecipeResponse.fromJson(dynamic json) {
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _baseUri = json["baseUri"];
    _offset = json["offset"];
    _number = json["number"];
    _totalResults = json["totalResults"];
    _processingTimeMs = json["processingTimeMs"];
    _expires = json["expires"];
    _isStale = json["isStale"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_results != null) {
      map["results"] = _results?.map((v) => v.toJson()).toList();
    }
    map["baseUri"] = _baseUri;
    map["offset"] = _offset;
    map["number"] = _number;
    map["totalResults"] = _totalResults;
    map["processingTimeMs"] = _processingTimeMs;
    map["expires"] = _expires;
    map["isStale"] = _isStale;
    return map;
  }

}

/// id : 629963
/// title : "chilli chicken"
/// author : "swasthi"
/// readyInMinutes : 160
/// servings : 2
/// sourceUrl : "https://spoonacular.com/-1424528841847"
/// openLicense : 2
/// image : "chilli-chicken-629963.jpg"

class Results {
  int? _id;
  String? _title;
  String? _author;
  int? _readyInMinutes;
  int? _servings;
  String? _sourceUrl;
  int? _openLicense;
  String? _image;

  int? get id => _id;
  String? get title => _title;
  String? get author => _author;
  int? get readyInMinutes => _readyInMinutes;
  int? get servings => _servings;
  String? get sourceUrl => _sourceUrl;
  int? get openLicense => _openLicense;
  String? get image => _image;

  Results({
      int? id, 
      String? title, 
      String? author, 
      int? readyInMinutes, 
      int? servings, 
      String? sourceUrl, 
      int? openLicense, 
      String? image}){
    _id = id;
    _title = title;
    _author = author;
    _readyInMinutes = readyInMinutes;
    _servings = servings;
    _sourceUrl = sourceUrl;
    _openLicense = openLicense;
    _image = image;
}

  Results.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _author = json["author"];
    _readyInMinutes = json["readyInMinutes"];
    _servings = json["servings"];
    _sourceUrl = json["sourceUrl"];
    _openLicense = json["openLicense"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["author"] = _author;
    map["readyInMinutes"] = _readyInMinutes;
    map["servings"] = _servings;
    map["sourceUrl"] = _sourceUrl;
    map["openLicense"] = _openLicense;
    map["image"] = _image;
    return map;
  }

}