class Recipe {
  final String title;
  final String imagePath;
  final List<String> ingredients;
  final List<String> instructions;
  bool isFavorite;

  Recipe({
    required this.title,
    required this.imagePath,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      imagePath: json['imagePath'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'imagePath': imagePath,
    'ingredients': ingredients,
    'instructions': instructions,
  };
}
