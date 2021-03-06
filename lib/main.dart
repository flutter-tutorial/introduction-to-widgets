import 'package:flutter/material.dart';

import 'alltogether.dart';
import 'basic-widgets.dart';
import 'changing-widgets.dart';
import 'changing-widgets2.dart';
import 'handling-gestures.dart';
import 'helloworld.dart';
import 'using-material-components.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
          buttonTheme: ButtonThemeData(
            buttonColor: Theme
                .of(context)
                .primaryColor,
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home: MyHomePage(title: 'Introduction to Widgets'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title});

  final String title;

  final Map<String, Widget> _introList = {
    'Hello World': HelloWorld(),
    'Basic Widgets': BasicWidgets(),
    'Using Material Components': TutorialHome(),
    'Handling Gestures': MyButton(),
    'Changing Widgets - Flow down': Counter(),
    'Changing Widgets - Flow up': Counter2(),
    'Shopping List - All together': ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
        Product(name: 'Icecream'),
      ],
    )
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _introList.keys
              .map((String menu) => _buildMenu(menu, context))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMenu(String menu, context) {
    return RaisedButton(
      elevation: 4.0,
      onPressed: () {
        print("You clicked " + menu);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _introList[menu]));
      },
      child: Text(menu),
    );
  }
}
