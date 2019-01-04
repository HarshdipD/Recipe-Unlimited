import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.45,
          child: Container(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
