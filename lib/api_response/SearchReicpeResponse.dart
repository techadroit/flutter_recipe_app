
import 'dart:convert';


SearchRecipeResponse searchRecipeResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return SearchRecipeResponse.fromJson(jsonData);
}

String searchRecipeResponseToJson(SearchRecipeResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SearchRecipeResponse {
  List<Result> results;
  String baseUri;
  int offset;
  int number;
  int totalResults;
  int processingTimeMs;
  int expires;
  bool isStale;

  SearchRecipeResponse({
    this.results,
    this.baseUri,
    this.offset,
    this.number,
    this.totalResults,
    this.processingTimeMs,
    this.expires,
    this.isStale,
  });

  factory SearchRecipeResponse.fromJson(Map<String, dynamic> json) => new SearchRecipeResponse(
    results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    baseUri: json["baseUri"],
    offset: json["offset"],
    number: json["number"],
    totalResults: json["totalResults"],
    processingTimeMs: json["processingTimeMs"],
    expires: json["expires"],
    isStale: json["isStale"],
  );

  Map<String, dynamic> toJson() => {
    "results": new List<dynamic>.from(results.map((x) => x.toJson())),
    "baseUri": baseUri,
    "offset": offset,
    "number": number,
    "totalResults": totalResults,
    "processingTimeMs": processingTimeMs,
    "expires": expires,
    "isStale": isStale,
  };
}

class Result {
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  int openLicense;
  String image;

  Result({
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    openLicense: json["openLicense"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "openLicense": openLicense,
    "image": image,
  };
}


// SearchRecipeResponse searchRecipeResponseFromJson(String str) {
//   final jsonData = json.decode(str);
//   return SearchRecipeResponse.fromJson(jsonData);
// }

// String searchRecipeResponseToJson(SearchRecipeResponse data) {
//   final dyn = data.toJson();
//   return json.encode(dyn);
// }

// class SearchRecipeResponse {
//   List<Result> results;
//   String baseUri;
//   int offset;
//   int number;
//   int totalResults;
//   int processingTimeMs;
//   int expires;
//   bool isStale;

//   SearchRecipeResponse({
//     this.results,
//     this.baseUri,
//     this.offset,
//     this.number,
//     this.totalResults,
//     this.processingTimeMs,
//     this.expires,
//     this.isStale,
//   });

//   factory SearchRecipeResponse.fromJson(Map<String, dynamic> json) => new SearchRecipeResponse(
//     results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     baseUri: json["baseUri"],
//     offset: json["offset"],
//     number: json["number"],
//     totalResults: json["totalResults"],
//     processingTimeMs: json["processingTimeMs"],
//     expires: json["expires"],
//     isStale: json["isStale"],
//   );

//   Map<String, dynamic> toJson() => {
//     "results": new List<dynamic>.from(results.map((x) => x.toJson())),
//     "baseUri": baseUri,
//     "offset": offset,
//     "number": number,
//     "totalResults": totalResults,
//     "processingTimeMs": processingTimeMs,
//     "expires": expires,
//     "isStale": isStale,
//   };
// }

// class Result {
//   int id;
//   String title;
//   int readyInMinutes;
//   int servings;
//   String image;
//   List<String> imageUrls;

//   Result({
//     this.id,
//     this.title,
//     this.readyInMinutes,
//     this.servings,
//     this.image,
//     this.imageUrls,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => new Result(
//     id: json["id"],
//     title: json["title"],
//     readyInMinutes: json["readyInMinutes"],
//     servings: json["servings"],
//     image: json["image"],
//     imageUrls: new List<String>.from(json["imageUrls"].map((x) => x)),
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "readyInMinutes": readyInMinutes,
//     "servings": servings,
//     "image": image,
//     "imageUrls": new List<dynamic>.from(imageUrls.map((x) => x)),
//   };
// }

VideoListResponse videoListResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return VideoListResponse.fromJson(jsonData);
}

String videoListResponseToJson(VideoListResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VideoListResponse {
  List<Video> videos;
  int totalResults;

  VideoListResponse({
    this.videos,
    this.totalResults,
  });

  factory VideoListResponse.fromJson(Map<String, dynamic> json) => new VideoListResponse(
    videos: new List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "videos": new List<dynamic>.from(videos.map((x) => x.toJson())),
    "totalResults": totalResults,
  };
}

class Video {
  String title;
  int length;
  double rating;
  String shortTitle;
  String thumbnail;
  int views;
  String youTubeId;

  Video({
    this.title,
    this.length,
    this.rating,
    this.shortTitle,
    this.thumbnail,
    this.views,
    this.youTubeId,
  });

  factory Video.fromJson(Map<String, dynamic> json) => new Video(
    title: json["title"],
    length: json["length"],
    rating: json["rating"].toDouble(),
    shortTitle: json["shortTitle"],
    thumbnail: json["thumbnail"],
    views: json["views"],
    youTubeId: json["youTubeId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "length": length,
    "rating": rating,
    "shortTitle": shortTitle,
    "thumbnail": thumbnail,
    "views": views,
    "youTubeId": youTubeId,
  };
}




