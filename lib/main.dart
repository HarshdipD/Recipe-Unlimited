import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'grocery_list.dart';
import 'recipe_list.dart';
import 'home_page.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myState()
  )
);

class myState extends StatefulWidget {
  @override
  _myStateState createState() => _myStateState();
}

class _myStateState extends State<myState> {
  int _selectedIndex = 0;
  final _bottomBarOptions = [
    HomePage(),
    RecipeList(),
    GroceryList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      /*appBar: AppBar(
        title: Text("Recipe App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            ),
        ],
      ),*/


        /*endDrawer: Drawer(
          elevation: 2.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Divider(
                height: 15.0,
              ),
              ListTile(
                title: Text('Harshdip Singh'),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Share App'),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Review us'),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),*/
      body: Center(
        child: _bottomBarOptions.elementAt(_selectedIndex),
      ),
        //BOTTOM NAVIGATION BAR

        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                title: Text("My Recipes"),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store),
                title: Text("My Grocery List"),
              ),
        ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepOrange,
          onTap: _onItemTapped,
        ),
    );
  }

  /*
  To navigate to different pages
   */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

