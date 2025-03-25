import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class RecipeProvider {
  static List<Recipe> cachedRecipes = [];

  static Future<List<Recipe>> loadRecipes() async {
    if (cachedRecipes.isNotEmpty) return cachedRecipes;

    final String jsonString = await rootBundle.loadString('assets/data/recipes.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final recipes = jsonList.map((data) => Recipe.fromJson(data)).toList();

    final prefs = await SharedPreferences.getInstance();
    final favTitles = prefs.getStringList('favorites') ?? [];

    for (var recipe in recipes) {
      if (favTitles.contains(recipe.title)) {
        recipe.isFavorite = true;
      }
    }

    cachedRecipes = recipes;
    return recipes;
  }

  static Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favTitles = cachedRecipes
        .where((r) => r.isFavorite)
        .map((r) => r.title)
        .toList();
    await prefs.setStringList('favorites', favTitles);
  }
}
