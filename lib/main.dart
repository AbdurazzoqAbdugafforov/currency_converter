import 'package:currency_converter/dependancy_manager.dart';
import 'locale_source.dart';
import 'app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  await LocalSource.getInstance();
  runApp(const MyApp());
}
