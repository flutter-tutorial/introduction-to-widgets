import 'package:flutter/material.dart';

import 'helloworld.dart';
void main() => runApp(MyApp());

final Map<String, Widget>_introList = {
  'Hello World': HelloWorld(),
};

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
      ),
      home: MyHomePage(title: 'Introduction to Widgets'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title});

  final String title;

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
          children: _introList.keys.map(
                  (String menu) => _buildMenu(menu, context)
          ).toList(),
        ),
      ),
    );
    return null;
  }

  Widget _buildMenu(String menu, context) {
    return FlatButton(
      onPressed: () {
        print("You clicked " + menu);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _introList[menu])
        );
      },
      child: Text(menu),
    );
  }
}
