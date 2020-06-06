
import 'package:flutter/material.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/textstyle.dart';

class ErrorScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          color: errorColor,
          child: Center(
            child:Padding(
              padding: EdgeInsets.all(24),
              child: Text("No api key found. "
                  "Please check the readme for more information.",
              style: errorStyle,),
            ),
          ),
        ),
      ),
    );
  }

}