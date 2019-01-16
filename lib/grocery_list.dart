import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> with AutomaticKeepAliveClientMixin
{
  String item_name = "";
  String item_qtty = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List grocery_list = List();

  @override
  void initState() {
    super.initState();
    grocery_list.add("Eggs");
    grocery_list.add("Carrots");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grocery List", style: TextStyle(color: Colors.black,),),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,

        ),
          key: _scaffoldKey,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: 'Add an item',
              backgroundColor: Colors.deepOrange,
              onPressed:(){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Enter a new item"),
                        content: new Container(
                          width: 260.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xFFFFFF),
                            borderRadius:
                            new BorderRadius.all(new Radius.circular(32.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              // dialog centre
                              new Expanded(
                                child: new Container(
                                    child: new TextField(
                                      decoration: new InputDecoration(
                                        enabledBorder: new OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepOrange, width: 1.0),
                                        ),
                                        labelStyle: new TextStyle(color: Colors.green),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                        ),
                                        filled: true,
                                        contentPadding: new EdgeInsets.only(
                                            left: 10.0,
                                            top: 10.0,
                                            bottom: 10.0,
                                            right: 10.0),
                                        hintText: ' Item name',
                                        hintStyle: new TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 12.0,
                                          fontFamily: 'helvetica_neue_light',
                                        ),
                                      ),
                                      onChanged: (String value){
                                        item_name = value;
                                      },
                                    )),
                                flex: 2,
                              ),
                              new Expanded(
                                child: new Container(
                                    child: new TextField(
                                      decoration: new InputDecoration(
                                        enabledBorder: new OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepOrange, width: 1.0),
                                        ),
                                        labelStyle: new TextStyle(color: Colors.green),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                        ),
                                        filled: true,
                                        contentPadding: new EdgeInsets.only(
                                            left: 10.0,
                                            top: 10.0,
                                            bottom: 10.0,
                                            right: 10.0),
                                        hintText: ' Item quantity',
                                        hintStyle: new TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 12.0,
                                          fontFamily: 'helvetica_neue_light',
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (String value){
                                        item_qtty = value;
                                      },
                                    )
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),

                        actions: <Widget>[
                          FlatButton(
                            padding: new EdgeInsets.all(16.0),
                            child: new Text(
                              'Add to list',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: (){
                              setState(() {
                                if(item_name != "" && item_qtty == ""){
                                  //Just add the item name, and put quantity as ""
                                  grocery_list.add(item_name);  //Add the name
                                  //TO REMOVE PREVIOUS SNACK BAR, IF ANY. WORK ON CONTEXT THING LOL
                                  //Scaffold.of(context).removeCurrentSnackBar();
                                  _displaySnackBarONE(context, item_name);

                                }
                                else if(item_name != "" && item_qtty != ""){
                                  //Add item with its quantity
                                  _displaySnackBarTWO(context);
                                  grocery_list.add(item_name);  //Add the item name
                                }
                                else if(item_name == ""){
                                  //Do nothing bc there's no name, so the quantity doesn't matter anymore
                                  _displaySnackBarTHREE(context);
                                }
                                item_name = "";
                                Navigator.of(context, rootNavigator: true).pop();//Close the alert box after adding to list
                              });
                            },
                          )
                        ],
                      );
                    }
                );
              }
          ),
          //WOW THIS BUTTON WAS LONG CODE LOL


          /* GROCERY LIST */
          body: ListView.builder(
            itemCount: grocery_list.length,
            itemBuilder: (BuildContext context, int index){
              final String item = grocery_list[index];
              return Dismissible(
                key: Key(index.toString()),
                child: Container(
                  child: ListTile(
                    title: Text(grocery_list[index]),
                  ),
                  color: Colors.white,
                ),
                //BACKGROUND CONTAINER TO CHECK OFF THE ITEM
                background: Container(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Icon(Icons.check),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                //BACKGROUND CONTAINER TO DELETE THE ITEM
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Icon(Icons.delete),
                  ),
                  alignment: Alignment.centerRight,
                ),
                //FUNCTION ON DISMISSED
                onDismissed: (DismissDirection direction){
                  setState(() {
                    grocery_list.removeAt(index);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(direction == DismissDirection.startToEnd ? 'Item checked!' : 'Item deleted!'),
                          action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                setState(() {
                                  //this.grocery_list.insert(index, item_name);
                                });
                              }),
                        )
                    );
                  });
                },
              );
            },
          )
      ),
    );
  }
  /************
  * FUNCTIONS *
  ************/

  _displaySnackBarONE(BuildContext context, index) {
    final snackBar = SnackBar(
        content: Text('Item without quantity added!'),
        action: SnackBarAction(label: 'UNDO',
            onPressed: (){
            //Undo the add thing
            //TO DO
              setState(() {
                this.grocery_list.insert(index, grocery_list);
              });
            }
            ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _displaySnackBarTWO(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Item added!'),
      action: SnackBarAction(label: 'UNDO',
          onPressed: (){
            //Undo the add thing
            //TO DO
          }
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _displaySnackBarTHREE(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Item not added!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

//CLASS ITEM THAT WILL CONTAIN ITEM NAME AND QUANTITY
class item
{
  
}