import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class DetailMealScreens extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    Widget nameItem(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget listDetails(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl),
              ),
              nameItem(context, 'Ingredients'),
              listDetails(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Text(selectedMeal.ingredients[index])),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              nameItem(context, 'Steps'),
              listDetails(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 4,
                      ),
                      // draw horizontal line
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
