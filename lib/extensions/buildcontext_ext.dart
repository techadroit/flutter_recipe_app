
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {

  TextStyle? ascentSubtitle1() {
    return Theme.of(this).accentTextTheme.subtitle1;
  }

  TextStyle? ascentSubtitle2() {
    return Theme.of(this).accentTextTheme.subtitle2;
  }

  TextStyle? ascentBody1() {
    return Theme.of(this).accentTextTheme.bodyText1;
  }

  TextStyle? ascentBody2() {
    return Theme.of(this).accentTextTheme.bodyText2;
  }

  TextStyle? primaryBody1() {
    return Theme.of(this).textTheme.bodyText1;
  }

  TextStyle? primaryBody2() {
    return Theme.of(this).textTheme.bodyText2;
  }

  TextStyle? primaryHead1() {
    return Theme.of(this).textTheme.headline1;
  }

  TextStyle? primaryHead2() {
    return Theme.of(this).textTheme.headline2;
  }

  TextStyle? primaryHead3() {
    return Theme.of(this).textTheme.headline3;
  }

  TextStyle? primarySubtitle1() {
    return Theme.of(this).textTheme.subtitle1;
  }

  TextStyle? primaryErrorStyle() {
    return  TextStyle(color : Colors.white,
        fontFamily: 'RobotoThin', fontSize: 40);
  }
}
