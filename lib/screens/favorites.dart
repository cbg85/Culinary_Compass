import 'package:flutter/material.dart';
import '../data/recipe_provider.dart';
import '../models/recipe.dart';
import 'recipe_details.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = RecipeProvider.cachedRecipes
        .where((r) => r.isFavorite)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return ListTile(
            leading: Image.asset(
              recipe.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(recipe.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
