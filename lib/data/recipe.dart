// To parse this JSON data, do
//
//     final recipeResp = recipeRespFromJson(jsonString);

import 'dart:convert';

class RecipeResp {
  int from;
  int to;
  bool more;
  int count;
  List<Hit> hits;

  RecipeResp({
    this.from,
    this.to,
    this.more,
    this.count,
    this.hits,
  });

  RecipeResp copyWith({
    int from,
    int to,
    bool more,
    int count,
    List<Hit> hits,
  }) =>
      RecipeResp(
        from: from ?? this.from,
        to: to ?? this.to,
        more: more ?? this.more,
        count: count ?? this.count,
        hits: hits ?? this.hits,
      );

  factory RecipeResp.fromJson(String str) =>
      RecipeResp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecipeResp.fromMap(Map<String, dynamic> json) => RecipeResp(
        from: json["from"],
        to: json["to"],
        more: json["more"],
        count: json["count"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "more": more,
        "count": count,
        "hits": List<dynamic>.from(hits.map((x) => x.toMap())),
      };
}

class Hit {
  Recipe recipe;
  bool bookmarked;
  bool bought;

  Hit({
    this.recipe,
    this.bookmarked,
    this.bought,
  });

  Hit copyWith({
    Recipe recipe,
    bool bookmarked,
    bool bought,
  }) =>
      Hit(
        recipe: recipe ?? this.recipe,
        bookmarked: bookmarked ?? this.bookmarked,
        bought: bought ?? this.bought,
      );

  factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromMap(json["recipe"]),
        bookmarked: json["bookmarked"],
        bought: json["bought"],
      );

  Map<String, dynamic> toMap() => {
        "recipe": recipe.toMap(),
        "bookmarked": bookmarked,
        "bought": bought,
      };
}

class Recipe {
  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  double recipeYield;
  List<String> dietLabels;
  List<HealthLabel> healthLabels;
  List<Caution> cautions;
  List<String> ingredientLines;
  List<Ingredient> ingredients;
  double calories;
  double totalWeight;
  double totalTime;
  Map<String, Total> totalNutrients;
  Map<String, Total> totalDaily;
  List<Digest> digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  Recipe copyWith({
    String uri,
    String label,
    String image,
    String source,
    String url,
    String shareAs,
    double recipeYield,
    List<String> dietLabels,
    List<HealthLabel> healthLabels,
    List<Caution> cautions,
    List<String> ingredientLines,
    List<Ingredient> ingredients,
    double calories,
    double totalWeight,
    double totalTime,
    Map<String, Total> totalNutrients,
    Map<String, Total> totalDaily,
    List<Digest> digest,
  }) =>
      Recipe(
        uri: uri ?? this.uri,
        label: label ?? this.label,
        image: image ?? this.image,
        source: source ?? this.source,
        url: url ?? this.url,
        shareAs: shareAs ?? this.shareAs,
        recipeYield: recipeYield ?? this.recipeYield,
        dietLabels: dietLabels ?? this.dietLabels,
        healthLabels: healthLabels ?? this.healthLabels,
        cautions: cautions ?? this.cautions,
        ingredientLines: ingredientLines ?? this.ingredientLines,
        ingredients: ingredients ?? this.ingredients,
        calories: calories ?? this.calories,
        totalWeight: totalWeight ?? this.totalWeight,
        totalTime: totalTime ?? this.totalTime,
        totalNutrients: totalNutrients ?? this.totalNutrients,
        totalDaily: totalDaily ?? this.totalDaily,
        digest: digest ?? this.digest,
      );

  factory Recipe.fromJson(String str) => Recipe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"].toDouble(),
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<HealthLabel>.from(
            json["healthLabels"].map((x) => healthLabelValues.map[x])),
        cautions: List<Caution>.from(
            json["cautions"].map((x) => cautionValues.map[x])),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromMap(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"].toDouble(),
        totalTime: json["totalTime"].toDouble(),
        totalNutrients: Map.from(json["totalNutrients"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        totalDaily: Map.from(json["totalDaily"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        digest: List<Digest>.from(json["digest"].map((x) => Digest.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "uri": uri,
        "label": label,
        "image": image,
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(
            healthLabels.map((x) => healthLabelValues.reverse[x])),
        "cautions":
            List<dynamic>.from(cautions.map((x) => cautionValues.reverse[x])),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toMap())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "totalNutrients": Map.from(totalNutrients)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "totalDaily": Map.from(totalDaily)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "digest": List<dynamic>.from(digest.map((x) => x.toMap())),
      };
}

enum Caution { SULFITES, FODMAP, SOY }

final cautionValues = EnumValues({
  "FODMAP": Caution.FODMAP,
  "Soy": Caution.SOY,
  "Sulfites": Caution.SULFITES
});

class Digest {
  String label;
  String tag;
  SchemaOrgTag schemaOrgTag;
  double total;
  bool hasRdi;
  double daily;
  Unit unit;
  List<Digest> sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  Digest copyWith({
    String label,
    String tag,
    SchemaOrgTag schemaOrgTag,
    double total,
    bool hasRdi,
    double daily,
    Unit unit,
    List<Digest> sub,
  }) =>
      Digest(
        label: label ?? this.label,
        tag: tag ?? this.tag,
        schemaOrgTag: schemaOrgTag ?? this.schemaOrgTag,
        total: total ?? this.total,
        hasRdi: hasRdi ?? this.hasRdi,
        daily: daily ?? this.daily,
        unit: unit ?? this.unit,
        sub: sub ?? this.sub,
      );

  factory Digest.fromJson(String str) => Digest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Digest.fromMap(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"] == null
            ? null
            : schemaOrgTagValues.map[json["schemaOrgTag"]],
        total: json["total"].toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"].toDouble(),
        unit: unitValues.map[json["unit"]],
        sub: json["sub"] == null
            ? null
            : List<Digest>.from(json["sub"].map((x) => Digest.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag == null
            ? null
            : schemaOrgTagValues.reverse[schemaOrgTag],
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub":
            sub == null ? null : List<dynamic>.from(sub.map((x) => x.toMap())),
      };
}

enum SchemaOrgTag {
  FAT_CONTENT,
  CARBOHYDRATE_CONTENT,
  PROTEIN_CONTENT,
  CHOLESTEROL_CONTENT,
  SODIUM_CONTENT,
  SATURATED_FAT_CONTENT,
  TRANS_FAT_CONTENT,
  FIBER_CONTENT,
  SUGAR_CONTENT
}

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { G, MG, UNIT_G, EMPTY, KCAL, IU }

final unitValues = EnumValues({
  "%": Unit.EMPTY,
  "g": Unit.G,
  "IU": Unit.IU,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

enum HealthLabel { PEANUT_FREE, TREE_NUT_FREE, ALCOHOL_FREE, SUGAR_CONSCIOUS }

final healthLabelValues = EnumValues({
  "Alcohol-Free": HealthLabel.ALCOHOL_FREE,
  "Peanut-Free": HealthLabel.PEANUT_FREE,
  "Sugar-Conscious": HealthLabel.SUGAR_CONSCIOUS,
  "Tree-Nut-Free": HealthLabel.TREE_NUT_FREE
});

class Ingredient {
  String text;
  double weight;

  Ingredient({
    this.text,
    this.weight,
  });

  Ingredient copyWith({
    String text,
    double weight,
  }) =>
      Ingredient(
        text: text ?? this.text,
        weight: weight ?? this.weight,
      );

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        weight: json["weight"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "weight": weight,
      };
}

class Total {
  String label;
  double quantity;
  Unit unit;

  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  Total copyWith({
    String label,
    double quantity,
    Unit unit,
  }) =>
      Total(
        label: label ?? this.label,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );

  factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Total.fromMap(Map<String, dynamic> json) => Total(
        label: json["label"],
        quantity: json["quantity"].toDouble(),
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "quantity": quantity,
        "unit": unitValues.reverse[unit],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
