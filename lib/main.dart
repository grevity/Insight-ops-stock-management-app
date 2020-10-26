import 'package:auto_route/auto_route.dart';
import 'package:stock_management/routes/router.gr.dart' as RouterGenerate;
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: ExtendedNavigator.builder(
        router: RouterGenerate.Router(),
        initialRoute: '/splashscreen',
        builder: (context, extendedNav) => Theme(
          data: ThemeData.light(),
          child: extendedNav,
        ),
      ),
    );
  }
}