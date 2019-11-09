//import 'package:flutter/material.dart';
//import 'package:receipe/data/recipe.dart';
//import 'package:receipe/pages/recipe_page.dart';
//import 'package:receipe/theme.dart';
//
//class IngredientWidget extends StatelessWidget {
//  final Ingredient ingredient;
//
//  IngredientWidget({this.ingredient});
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.only(right: 10, bottom: 10),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Card(
//            elevation: 4.0,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(15),
//            ),
//            child: Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(15),
//                image: DecorationImage(
//                  image: NetworkImage("${ingredient.}"),
//                  fit: BoxFit.cover,
//                ),
//              ),
//              height: 380,
//              width: 260,
//              child: Stack(
//                children: [
//                  Positioned(
//                    bottom: 5,
//                    child: Padding(
//                      padding: EdgeInsets.symmetric(horizontal: 10),
//                      child: Container(
//                        width: 240,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            FlatButton(
//                              onPressed: () {},
//                              child: Text("kkk likes"),
//                              color: kPrimaryColor,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10),
//                              ),
//                            ),
//                            FlatButton(
//                              onPressed: () {},
//                              child: Text("~${ingredient.totalTime} min"),
//                              color: Colors.white,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10),
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
//          SizedBox(height: 10),
//          Container(
//            width: 250,
//            child: Text(
//              ingredient.label,
//              overflow: TextOverflow.fade,
//              maxLines: 1,
//              style: TextStyle(
//                fontWeight: FontWeight.w700,
//                fontSize: 23,
//                letterSpacing: .9,
//              ),
//            ),
//          ),
//          SizedBox(height: 5),
//          Text.rich(
//            TextSpan(
//              text: 'Recipe by: ',
//              style: TextStyle(color: Colors.black54),
//              children: <InlineSpan>[
//                TextSpan(
//                    text: "Uknown",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 15,
//                        color: Colors.black87)),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class RecipeListWidget extends StatelessWidget {
//  final Recipe recipe;
//
//  RecipeListWidget(this.recipe);
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => RecipePage(
//                    recipe: recipe,
//                  )),
//        );
//      },
//      child: Padding(
//        padding: EdgeInsets.symmetric(vertical: 10),
//        child: Container(
//          height: 120,
//          child: Row(
//            children: [
//              Container(
//                height: 120,
//                width: 90,
//                decoration: ShapeDecoration(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(5)),
//                  image: DecorationImage(
//                      image: NetworkImage("${recipe.image}"),
//                      fit: BoxFit.cover),
//                ),
//              ),
//              Expanded(
//                child: Padding(
//                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text(
//                        "${recipe.label}",
//                        overflow: TextOverflow.fade,
//                        maxLines: 1,
//                        style: TextStyle(
//                          fontWeight: FontWeight.w900,
//                          color: Colors.black87,
//                          fontSize: 16,
//                        ),
//                      ),
//                      SizedBox(height: 10),
//                      Text.rich(
//                        TextSpan(
//                          text: 'Recipe by: ',
//                          style: TextStyle(color: Colors.black54),
//                          children: <InlineSpan>[
//                            TextSpan(
//                                text: 'Unkown',
//                                style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 15,
//                                    color: Colors.black87)),
//                          ],
//                        ),
//                      ),
//                      Spacer(),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Text(
//                            "dd likes",
//                            style: TextStyle(
//                              fontWeight: FontWeight.w700,
//                              color: Colors.black54,
//                              fontSize: 14,
//                            ),
//                          ),
//                          Text(
//                            "~${recipe.totalTime} min",
//                            style: TextStyle(
//                              fontWeight: FontWeight.w700,
//                              color: Colors.black45,
//                              fontSize: 14,
//                            ),
//                          )
//                        ],
//                      )
//                    ],
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
