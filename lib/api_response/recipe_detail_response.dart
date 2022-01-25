class RecipeDetailResponse {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  int? weightWatcherSmartPoints;
  String? gaps;
  bool? lowFodmap;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  double? spoonacularScore;
  double? healthScore;
  String? creditsText;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<dynamic>? cuisines;
  List<dynamic>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  WinePairing? winePairing;
  String? instructions;
  List<AnalyzedInstructions>? analyzedInstructions;
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
      this.preparationMinutes, 
      this.cookingMinutes, 
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
      this.originalId});

  RecipeDetailResponse.fromJson(dynamic json) {
    vegetarian = json["vegetarian"];
    vegan = json["vegan"];
    glutenFree = json["glutenFree"];
    dairyFree = json["dairyFree"];
    veryHealthy = json["veryHealthy"];
    cheap = json["cheap"];
    veryPopular = json["veryPopular"];
    sustainable = json["sustainable"];
    weightWatcherSmartPoints = json["weightWatcherSmartPoints"];
    gaps = json["gaps"];
    lowFodmap = json["lowFodmap"];
    preparationMinutes = json["preparationMinutes"];
    cookingMinutes = json["cookingMinutes"];
    aggregateLikes = json["aggregateLikes"];
    spoonacularScore = json["spoonacularScore"];
    healthScore = json["healthScore"];
    creditsText = json["creditsText"];
    sourceName = json["sourceName"];
    pricePerServing = json["pricePerServing"];
    if (json["extendedIngredients"] != null) {
      extendedIngredients = [];
      json["extendedIngredients"].forEach((v) {
        extendedIngredients?.add(ExtendedIngredients.fromJson(v));
      });
    }
    id = json["id"];
    title = json["title"];
    readyInMinutes = json["readyInMinutes"];
    servings = json["servings"];
    sourceUrl = json["sourceUrl"];
    image = json["image"];
    imageType = json["imageType"];
    summary = json["summary"];
    // if (json["cuisines"] != null) {
    //   cuisines = [];
    //   json["cuisines"].forEach((v) {
    //     cuisines?.add(Cuisines.fromJson(v));
    //   });
    // }
    // if (json["dishTypes"] != null) {
    //   dishTypes = [];
    //   json["dishTypes"].forEach((v) {
    //     dishTypes?.add(dynamic.fromJson(v));
    //   });
    // }
    diets = json["diets"] != null ? json["diets"].cast<String>() : [];
    // if (json["occasions"] != null) {
    //   occasions = [];
    //   json["occasions"].forEach((v) {
    //     occasions?.add(dynamic.fromJson(v));
    //   });
    // }
    winePairing = json["winePairing"] != null ? WinePairing.fromJson(json["winePairing"]) : null;
    instructions = json["instructions"];
    if (json["analyzedInstructions"] != null) {
      analyzedInstructions = [];
      json["analyzedInstructions"].forEach((v) {
        analyzedInstructions?.add(AnalyzedInstructions.fromJson(v));
      });
    }
    originalId = json["originalId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["vegetarian"] = vegetarian;
    map["vegan"] = vegan;
    map["glutenFree"] = glutenFree;
    map["dairyFree"] = dairyFree;
    map["veryHealthy"] = veryHealthy;
    map["cheap"] = cheap;
    map["veryPopular"] = veryPopular;
    map["sustainable"] = sustainable;
    map["weightWatcherSmartPoints"] = weightWatcherSmartPoints;
    map["gaps"] = gaps;
    map["lowFodmap"] = lowFodmap;
    map["preparationMinutes"] = preparationMinutes;
    map["cookingMinutes"] = cookingMinutes;
    map["aggregateLikes"] = aggregateLikes;
    map["spoonacularScore"] = spoonacularScore;
    map["healthScore"] = healthScore;
    map["creditsText"] = creditsText;
    map["sourceName"] = sourceName;
    map["pricePerServing"] = pricePerServing;
    if (extendedIngredients != null) {
      map["extendedIngredients"] = extendedIngredients?.map((v) => v.toJson()).toList();
    }
    map["id"] = id;
    map["title"] = title;
    map["readyInMinutes"] = readyInMinutes;
    map["servings"] = servings;
    map["sourceUrl"] = sourceUrl;
    map["image"] = image;
    map["imageType"] = imageType;
    map["summary"] = summary;
    if (cuisines != null) {
      map["cuisines"] = cuisines?.map((v) => v.toJson()).toList();
    }
    if (dishTypes != null) {
      map["dishTypes"] = dishTypes?.map((v) => v.toJson()).toList();
    }
    map["diets"] = diets;
    if (occasions != null) {
      map["occasions"] = occasions?.map((v) => v.toJson()).toList();
    }
    if (winePairing != null) {
      map["winePairing"] = winePairing?.toJson();
    }
    map["instructions"] = instructions;
    if (analyzedInstructions != null) {
      map["analyzedInstructions"] = analyzedInstructions?.map((v) => v.toJson()).toList();
    }
    map["originalId"] = originalId;
    return map;
  }

}

class AnalyzedInstructions {
  String? name;
  List<Steps>? steps;

  AnalyzedInstructions({
      this.name, 
      this.steps});

  AnalyzedInstructions.fromJson(dynamic json) {
    name = json["name"];
    if (json["steps"] != null) {
      steps = [];
      json["steps"].forEach((v) {
        steps?.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    if (steps != null) {
      map["steps"] = steps?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Steps {
  int? number;
  String? step;
  List<dynamic>? ingredients;
  List<Equipment>? equipment;

  Steps({
      this.number, 
      this.step, 
      this.ingredients, 
      this.equipment});

  Steps.fromJson(dynamic json) {
    number = json["number"];
    step = json["step"];
    if (json["ingredients"] != null) {
      ingredients = [];
      json["ingredients"].forEach((v) {
        ingredients?.add(ExtendedIngredients.fromJson(v));
      });
    }
    if (json["equipment"] != null) {
      equipment = [];
      json["equipment"].forEach((v) {
        equipment?.add(Equipment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["number"] = number;
    map["step"] = step;
    if (ingredients != null) {
      map["ingredients"] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (equipment != null) {
      map["equipment"] = equipment?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;
  Temperature? temperature;

  Equipment({
      this.id, 
      this.name, 
      this.localizedName, 
      this.image, 
      this.temperature});

  Equipment.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    localizedName = json["localizedName"];
    image = json["image"];
    temperature = json["temperature"] != null ? Temperature.fromJson(json["temperature"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["localizedName"] = localizedName;
    map["image"] = image;
    if (temperature != null) {
      map["temperature"] = temperature?.toJson();
    }
    return map;
  }

}

class Temperature {
  double? number;
  String? unit;

  Temperature({
      this.number, 
      this.unit});

  Temperature.fromJson(dynamic json) {
    number = json["number"];
    unit = json["unit"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["number"] = number;
    map["unit"] = unit;
    return map;
  }

}

class WinePairing {
  List<String>? pairedWines;
  String? pairingText;
  List<ProductMatches>? productMatches;

  WinePairing({
      this.pairedWines, 
      this.pairingText, 
      this.productMatches});

  WinePairing.fromJson(dynamic json) {
    pairedWines = json["pairedWines"] != null ? json["pairedWines"].cast<String>() : [];
    pairingText = json["pairingText"];
    if (json["productMatches"] != null) {
      productMatches = [];
      json["productMatches"].forEach((v) {
        productMatches?.add(ProductMatches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["pairedWines"] = pairedWines;
    map["pairingText"] = pairingText;
    if (productMatches != null) {
      map["productMatches"] = productMatches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductMatches {
  int? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  double? ratingCount;
  double? score;
  String? link;

  ProductMatches({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.imageUrl, 
      this.averageRating, 
      this.ratingCount, 
      this.score, 
      this.link});

  ProductMatches.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
    imageUrl = json["imageUrl"];
    averageRating = json["averageRating"];
    ratingCount = json["ratingCount"];
    score = json["score"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["price"] = price;
    map["imageUrl"] = imageUrl;
    map["averageRating"] = averageRating;
    map["ratingCount"] = ratingCount;
    map["score"] = score;
    map["link"] = link;
    return map;
  }

}

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