import 'package:db_movie/initializer.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;

  runApp(App(initialRoute: initialRoute));
}
