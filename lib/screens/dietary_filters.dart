import 'package:flutter/material.dart';

class DietaryFiltersScreen extends StatefulWidget {
  const DietaryFiltersScreen({super.key});

  @override
  State<DietaryFiltersScreen> createState() => _DietaryFiltersScreenState();
}

class _DietaryFiltersScreenState extends State<DietaryFiltersScreen> {
  bool glutenFree = false;
  bool vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dietary Filters')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Gluten-Free'),
            value: glutenFree,
            onChanged: (val) => setState(() => glutenFree = val),
          ),
          SwitchListTile(
            title: Text('Vegan'),
            value: vegan,
            onChanged: (val) => setState(() => vegan = val),
          ),
        ],
      ),
    );
  }
}
