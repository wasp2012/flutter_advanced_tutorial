import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/di/dependancy_injection.dart';
import 'package:flutter_advanced_tutorial/core/routing/app_router.dart';
import 'package:flutter_advanced_tutorial/doc_app.dart';

Future<void> main() async {
  await setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
