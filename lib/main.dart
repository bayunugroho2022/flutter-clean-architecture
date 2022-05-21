import 'package:clean_architecture/data/locator.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}