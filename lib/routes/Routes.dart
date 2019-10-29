import 'package:flutter/material.dart';
import 'package:flutterdemo/route_pages/BottomNav.dart';
import 'package:flutterdemo/route_pages/PageOne.dart';
import 'package:flutterdemo/route_pages/Tab_demo.dart';
final routes = {
  '/': (context) => BottomNav(),
  '/pageone': (context, {arguments}) => PageOne(arguments: arguments,),
  '/tabDemo': (context) => TabDemo(),
  '/tabOfTabController': (context) => TabControllerDemo()
};

Route onGenerateRoute (RouteSettings settings) {
  final String name = settings.name;
  final Function routeBuilder = routes[name];
  if (routeBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => routeBuilder(context, arguments: settings.arguments)
      );
      return route;
    }else {
      final Route route = MaterialPageRoute(
          builder: (context) => routeBuilder(context)
      );
      return route;
    }
  }
}