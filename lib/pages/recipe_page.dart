import 'package:flutter/material.dart';
import 'package:receipe/data/recipe.dart';
import 'package:receipe/theme.dart';

class RecipePage extends StatefulWidget {
  RecipePage({Key key, this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  Widget _buildIngredients(List<Ingredient> ingredients) {
    List<Widget> ing = ingredients.asMap().values.map((i) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Text(
              i.text,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            Spacer(),
            Text("${i.weight.toStringAsFixed(2)}g")
          ],
        ),
      );
    }).toList();

    ing.add(Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        "View all",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 1,
        ),
      ),
    ));

    return Column(
      children: ing,
    );
  }

  @override
  Widget build(BuildContext context) {
    var recipe = widget.recipe;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage("${recipe.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: MediaQuery.of(context).size.width + 150,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  onPressed: () {},
                                  child: Text("kkk likes"),
                                  color: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text("~${recipe.totalTime} min"),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage("res/img/profile.jpg"),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${recipe.label}",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 27,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                text: 'Recipe by: ',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
                children: <InlineSpan>[
                  TextSpan(
                      text: "Uknown",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87)),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2),
                  ),
                  _buildIngredients(recipe.ingredients),
                  SizedBox(height: 30),
                  _buildNutrients(recipe.totalNutrients),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildNutrients(Map<String, Total> totalNutrients) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: totalNutrients
                .map((k, v) {
                  return MapEntry(
                    k,
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Text(
                              "${v.quantity.toStringAsFixed(3)}",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            v.label,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${v.unit}",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
