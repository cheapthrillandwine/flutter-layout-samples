import 'package:flutter/material.dart';

import 'package:layout_app/placeholder.dart';
import 'package:layout_app/screens/home.dart';
import 'package:layout_app/screens/button_page.dart';
import 'package:layout_app/screens/list_page.dart';
import 'package:layout_app/screens/image_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Layout App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    // PlaceholderWidget(Colors.white),
    Home(),
    ButtonPage(),
    ListPage(),
    ImagePage(),
    PlaceholderWidget(Colors.blue)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blue,
          primaryColor: Colors.red,
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Buttons'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text("List")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Image'),
            )
          ],
        ),  

      )      
    );
  }

  void onTabTapped(int index) {
  setState(() {
    _currentIndex = index;
  });
}
 
}
