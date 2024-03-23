import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                widget.recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.recipe.label,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return ListTile(
                        leading: const Icon(Icons.check_circle), 
                        title: Text(
                          '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 10,
                    value: _sliderVal.toDouble(),
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey[
                        300],
                    label:
                        '${_sliderVal * widget.recipe.servings} servings',
                    onChanged: (newValue) {
                      setState(() {
                        _sliderVal = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
