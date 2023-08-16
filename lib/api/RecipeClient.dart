import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quick_recipe/model/Recipe.dart';
import 'package:quick_recipe/util/Constants.dart';

class RecipeClient {

  List<Recipe> parseRecipes(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http
        .get(Uri.parse(Constants.baseUrl + Constants.recipeEndpoint));

    if (kDebugMode) {
      print(response.body.toString());
    }
    // Use the compute function to run parseRecipes in a separate isolate.
    return parseRecipes(response.body);
  }
}