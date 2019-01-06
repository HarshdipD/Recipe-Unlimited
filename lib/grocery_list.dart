import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  String item_name = "";
  String item_qtty = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List grocery_list = List();

  @override
  void initState() {
    super.initState();
    grocery_list.add("n 1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
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
                                grocery_list.add(item_name);
                                _displaySnackBarONE(context);

                              }
                              else if(item_name != "" && item_qtty != ""){
                                //Add item with its quantity
                                _displaySnackBarTWO(context);
                              }
                              else if(item_name == "" && item_qtty != ""){
                                //Do nothing bc there's no name, just quantity
                                //Maybe say nothing added?
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
  _displaySnackBarONE(BuildContext context) {
    final snackBar = SnackBar(
        content: Text('Item without quantity added!'),
        action: SnackBarAction(label: 'Undo',
            onPressed: (){
            //Undo the add thing
            //TO DO
            }
            ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _displaySnackBarTWO(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Item added!'),
      action: SnackBarAction(label: 'Undo',
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
