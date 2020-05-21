import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'homePage.dart';
import 'person.dart';
import 'personListModel.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PersonListModel()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//List<Person> personList = new List<Person>();
