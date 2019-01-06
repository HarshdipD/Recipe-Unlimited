import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  String input = "";
  List grocery_list = List();

  @override
  void initState() {
    super.initState();
    grocery_list.add("n 1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:(){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Enter a new item"),
                      content: TextField(
                        onChanged: (String value){
                          input = value;
                        },
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Add"),
                          onPressed: (){
                            setState(() {
                              grocery_list.add(input);
                            });
                          },
                        )
                      ],
                    );
                  }
              );
            }
        ),
        body: ListView.builder(
          itemCount: grocery_list.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: Key(index.toString()),
              child: ListTile(
                title: Text(grocery_list[index]),
              ),
            );
          },
        )
    );
  }
}


/*
class GroceryList extends StatelessWidget {

  List list = List();

  @override
  void initState(){
    super.initState();
  }


}

 */