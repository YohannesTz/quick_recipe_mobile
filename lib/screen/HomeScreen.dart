import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_recipe/ui/RecipeCard.dart';
import '../api/RecipeClient.dart';
import '../model/Recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Recipe>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = loadData();
  }

  Future<List<Recipe>> loadData() async {
    final recipeClient = RecipeClient();
    final list = await recipeClient.fetchRecipes();
    return list;
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF4a5568), // Set background color of the app bar
        title: const Text(
          'QuickRecipe',
          style: TextStyle(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0), // Set the height of the shadow
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff6c7c8d),
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset in the y-axis direction
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF4a5568),
        child: _buildPageContent(),
      ),
    );
  }

  Widget _buildPageContent() {
    return FutureBuilder<List<Recipe>>(
      future: _futureRecipes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          if (kDebugMode) {
            print(snapshot.error);
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/error_lottie.json',
                    repeat: false),
                const Text(
                  "Oops! something was wrong",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: loadData,
                    child: const Text('Retry'),
                  ),
                ),
              ],
            ),
          );
        } else {
          final recipeList = snapshot.data;

          if (recipeList!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset('assets/lottie/empty_animation_lottie.json',
                      repeat: true),
                  const Text(
                    "Oops! we found nothing...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: loadData,
                      child: const Text('Retry'),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Display your recipe list UI here
            return ListView.builder(
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                final recipe = recipeList[index];
                // Build UI for each recipe item
                return RecipeCard(recipeItem: recipe);
              },
            );
          }
        }
      },
    );
  }
}
