
import 'dart:convert';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  int id;
  int userId;
  String title;
  String? description;
  List<Instruction> instructions;
  List<Ingredient> ingredients;
  DateTime createdAt;
  DateTime updatedAt;

  Recipe({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.instructions,
    required this.ingredients,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    userId: json["userId"],
    title: json["title"],
    description: json["description"],
    instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
    "description": description,
    "instructions": List<dynamic>.from(instructions.map((x) => x.toJson())),
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Ingredient {
  int id;
  String name;
  int size;
  String unitType;

  Ingredient({
    required this.id,
    required this.name,
    required this.size,
    required this.unitType,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    name: json["name"],
    size: json["size"],
    unitType: json["unitType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "size": size,
    "unitType": unitType,
  };
}

class Instruction {
  int id;
  String content;
  bool optional;

  Instruction({
    required this.id,
    required this.content,
    required this.optional,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    id: json["id"],
    content: json["content"],
    optional: json["optional"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "optional": optional,
  };
}
