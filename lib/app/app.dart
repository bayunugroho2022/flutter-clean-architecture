

import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance =
  MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    setErrorBuilder();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }

  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails details) {

      if(kDebugMode){
        print("Error FROM OUT_SIDE FRAMEWORK ");
        print("--------------------------------");
        print("Error :  ${details.exception}");
        print("StackTrace :  ${details.stack}");
      }

      return const Scaffold(
          body: Center(
              child: Text("Unexpected error. See console for details. \n ")));
    };
  }
}
