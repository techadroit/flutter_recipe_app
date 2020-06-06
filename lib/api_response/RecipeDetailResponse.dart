import 'dart:convert';

RecipeDetailResponse recipeDetailResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return RecipeDetailResponse.fromJson(jsonData);
}

String recipeDetailResponseToJson(RecipeDetailResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class RecipeDetailResponse {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  int aggregateLikes;
  double spoonacularScore;
  double healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<dynamic> diets;
  List<dynamic> occasions;
  WinePairing winePairing;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  dynamic originalId;

  RecipeDetailResponse({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
  });

  factory RecipeDetailResponse.fromJson(Map<String, dynamic> json) => new RecipeDetailResponse(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    lowFodmap: json["lowFodmap"],
    aggregateLikes: json["aggregateLikes"],
    spoonacularScore: json["spoonacularScore"].toDouble(),
    healthScore: json["healthScore"].toDouble(),
    creditsText: json["creditsText"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"].toDouble(),
    extendedIngredients: new List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: new List<String>.from(json["cuisines"].map((x) => x)),
    dishTypes: new List<String>.from(json["dishTypes"].map((x) => x)),
    diets: new List<dynamic>.from(json["diets"].map((x) => x)),
    occasions: new List<dynamic>.from(json["occasions"].map((x) => x)),
    winePairing: WinePairing.fromJson(json["winePairing"]),
    instructions: json["instructions"],
    analyzedInstructions: new List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "lowFodmap": lowFodmap,
    "aggregateLikes": aggregateLikes,
    "spoonacularScore": spoonacularScore,
    "healthScore": healthScore,
    "creditsText": creditsText,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": new List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "image": image,
    "imageType": imageType,
    "summary": summary,
    "cuisines": new List<dynamic>.from(cuisines.map((x) => x)),
    "dishTypes": new List<dynamic>.from(dishTypes.map((x) => x)),
    "diets": new List<dynamic>.from(diets.map((x) => x)),
    "occasions": new List<dynamic>.from(occasions.map((x) => x)),
    "winePairing": winePairing.toJson(),
    "instructions": instructions,
    "analyzedInstructions": new List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "originalId": originalId,
  };
}

class AnalyzedInstruction {
  String name;
  List<Step> steps;

  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => new AnalyzedInstruction(
    name: json["name"],
    steps: new List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": new List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => new Step(
    number: json["number"],
    step: json["step"],
    ingredients: new List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: new List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": new List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "equipment": new List<dynamic>.from(equipment.map((x) => x.toJson())),
    "length": length == null ? null : length.toJson(),
  };
}

class Ent {
  int id;
  String name;
  String image;

  Ent({
    this.id,
    this.name,
    this.image,
  });

  factory Ent.fromJson(Map<String, dynamic> json) => new Ent(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class Length {
  int number;
  String unit;

  Length({
    this.number,
    this.unit,
  });

  factory Length.fromJson(Map<String, dynamic> json) => new Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}

class ExtendedIngredient {
  int id;
  String aisle;
  String image;
  String consistency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.original,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.metaInformation,
    this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => new ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consistency: json["consistency"],
    name: json["name"],
    original: json["original"],
    originalString: json["originalString"],
    originalName: json["originalName"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    meta: new List<String>.from(json["meta"].map((x) => x)),
    metaInformation: new List<String>.from(json["metaInformation"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistency,
    "name": name,
    "original": original,
    "originalString": originalString,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": new List<dynamic>.from(meta.map((x) => x)),
    "metaInformation": new List<dynamic>.from(metaInformation.map((x) => x)),
    "measures": measures.toJson(),
  };
}

class Measures {
  Metric us;
  Metric metric;

  Measures({
    this.us,
    this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => new Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}

class Metric {
  double amount;
  String unitShort;
  String unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => new Metric(
    amount: json["amount"].toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}

class WinePairing {
  WinePairing();

  factory WinePairing.fromJson(Map<String, dynamic> json) => new WinePairing(
  );

  Map<String, dynamic> toJson() => {
  };
}
