import 'package:flutter/material.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/textstyle.dart';
import 'package:recipe_flutter/extensions/buildcontext_ext.dart';

class ErrorScreen extends StatelessWidget {
  static ErrorScreen get(Failure failure) {
    if (failure is NoResultFound) {
      return ErrorScreen("No Result Found");
    } else {
      return ErrorScreen("Something Went Wrong");
    }
  }

  final String message;

  ErrorScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: errorColor,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            message,
            style: context.primaryErrorStyle(),
          ),
        ),
      ),
    );
  }
}

class InvalidKeyErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: errorColor,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "No api key found. "
                "Please check the readme for more information.",
                style: context.primaryErrorStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
