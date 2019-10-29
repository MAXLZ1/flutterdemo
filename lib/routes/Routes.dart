import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/route_pages/BottomNav.dart';
import 'package:flutterdemo/route_pages/PageOne.dart';
import 'package:flutterdemo/route_pages/Tab_demo.dart';

final routes = {
  '/': (context) => BottomNav(),
  '/pageone': (context, {arguments}) => PageOne(
        arguments: arguments,
      ),
  '/tabDemo': (context) => TabDemo(),
  '/tabOfTabController': (context) => TabControllerDemo()
};

Route onGenerateRoute(RouteSettings settings) {
  final String name = settings.name;
  final Function routeBuilder = routes[name];
  if (routeBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
        builder: (context) => routeBuilder(context, arguments: settings.arguments)
      );
//      final Route route = PageRouteBuilder(
//        pageBuilder: (BuildContext context, Animation<double> animation,
//            Animation<double> secondaryAnimation) {
////            return FadeTransition(
////              opacity: animation,
////              child: routeBuilder(context, arguments: settings.arguments),
////            );
////            return ScaleTransition(
////              scale: Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
////                  parent:animation,
////                  curve: Curves.fastOutSlowIn
////              )),
////              child: routeBuilder(context, arguments: settings.arguments),
////            );
////            return RotationTransition(
////              turns: Tween(begin:0.0,end:1.0)
////                  .animate(CurvedAnimation(
////                  parent: animation,
////                  curve: Curves.fastOutSlowIn
////              )),
////              child: ScaleTransition(
////                scale:Tween(begin: 0.0,end:1.0)
////                    .animate(CurvedAnimation(
////                    parent: animation,
////                    curve:Curves.fastOutSlowIn
////                )),
////                child: routeBuilder(context, arguments: settings.arguments),
////              )
////            );
//          return SlideTransition(
//            position:
//                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(.0, 0.0))
//                    .animate(CurvedAnimation(
//                        parent: animation, curve: Curves.fastOutSlowIn)),
//            child: routeBuilder(context, arguments: settings.arguments),
//          );
//        },
//        transitionDuration: Duration(milliseconds: 500),
//      );
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => routeBuilder(context));
      return route;
    }
  }
}
