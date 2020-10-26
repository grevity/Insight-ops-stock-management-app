import 'package:auto_route/auto_route_annotations.dart';
import 'package:stock_management/screens/home/index.dart';
import 'package:stock_management/screens/splash.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: HomeIndex, path: "/"),
    CupertinoRoute(page: SplashScreen, initial: true, path: "/splashscreen")
  ],
)
class $Router {}
