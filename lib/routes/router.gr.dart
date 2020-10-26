// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../screens/home/index.dart';
import '../screens/splash.dart';

class Routes {
  static const String homeIndex = '/';
  static const String splashScreen = '/splashscreen';
  static const all = <String>{
    homeIndex,
    splashScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeIndex, page: HomeIndex),
    RouteDef(Routes.splashScreen, page: SplashScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeIndex: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeIndex(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
  };
}
