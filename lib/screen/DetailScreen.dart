import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_recipe/model/Recipe.dart';
import 'package:quick_recipe/ui/IngredientItem.dart';
import 'package:quick_recipe/ui/InstructionItem.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4a5568),
      // Set background color of the app bar
      body: Container(
        color: const Color(0xFF4a5568),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: 360.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(vertical: 16),
                centerTitle: true,
                title: Text(
                  recipe.title,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/food_bg_unsplash.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.3, 6.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: const Color(0xFF4a5568),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              recipe.description == null
                  ? const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text(
                        'No description was provided for this recipe...',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        recipe.description!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ])),
            SliverList(
              delegate: SliverChildListDelegate(
                List<Widget>.generate(
                  recipe.ingredients.length,
                  (index) => IngredientItem(
                    ingredient: recipe.ingredients[index],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text(
                    'Instructions',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List<Widget>.generate(
                  recipe.instructions.length,
                  (index) => InstructionItem(
                    instruction: recipe.instructions[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
