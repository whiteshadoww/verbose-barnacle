import 'package:flutter/material.dart';
import 'package:receipe/data/recipe.dart';
import 'package:receipe/theme.dart';
import 'package:receipe/widgets/recipe_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage("res/img/profile.jpg"),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Morning Recipes",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        letterSpacing: 1.2,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: Container(
                    height: 470,
                    child: FutureBuilder(
                      future: _getRecipe(context),
                      builder: (ctx, snp) {
                        if (snp.data == null)
                          return Center(
                            child: Text("No Data"),
                          );
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snp.data.hits.length,
                            itemBuilder: (crx, pos) {
                              return RecipeWidget(
                                recipe: snp.data.hits[pos].recipe,
                              );
                            });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          child: Text(
                            "Newest",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.black45,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 17),
                        ),
                        Padding(
                          child: Text(
                            "Popular",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: kPrimaryColor,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 17),
                        ),
                        Padding(
                          child: Text(
                            "Featured",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.black45,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  initialData: null,
                  future: _getRecipe(context),
                  builder: (ctx, AsyncSnapshot<RecipeResp> snp) {
                    if (snp.hasError) {
                      print(snp.error);
                    }

                    if (snp.data == null)
                      return Center(
                        child: Text("No Data"),
                      );
                    return Column(
                      children: snp.data.hits.asMap().values.map((f) {
                        return RecipeListWidget(f.recipe);
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<RecipeResp> _getRecipe(BuildContext context) async {
    var d =
        await DefaultAssetBundle.of(context).loadString("res/values/d.json");
    return Future.value(RecipeResp.fromJson(d));
  }
}
