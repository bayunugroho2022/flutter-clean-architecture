import 'package:clean_architecture/app/locator.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}