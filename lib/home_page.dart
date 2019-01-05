import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: 1000.0,
              height: 300.0,
              child: Container(
                  color: Colors.black54,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                              child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.dehaze),
                                    tooltip: 'Profile and settings',
                                    onPressed: ()
                                        {
                                          print("abey!");
                                          //Navigator.push(context);
                                        },
                                  ),
                                  alignment: Alignment(1.0, -1.0),
                              ),
                            ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: CircleAvatar(
                            radius: 45.0,
                            backgroundImage: AssetImage('images/image1.jpeg'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child:
                            Text("Hey User",
                            style: TextStyle(color: Colors.white, fontSize: 17.0, fontFamily: "packages/cool_fonts/Roboto"),),
                        ),

                      ],
                    ),
                  ),
              ),
            ),
            Card(
              color: Colors.deepOrange,
              //child: Text("trhgfvd"),
            )
          ],
        ),

      ),
    );
  }
}


/*
child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.45,
          child: Container(
            //color: Colors.black54,
          ),
        ),
 */
/*
child: Column(
          children: [
            Expanded(
            //child: Text("hello world"),
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.45,
              child: Container(
                color: Colors.black54,
              ),
            ),
            )
          ],
        ),
 */