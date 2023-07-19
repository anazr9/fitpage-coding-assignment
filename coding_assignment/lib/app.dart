import 'package:coding_assignment/config/routes/app_routes.dart';
import 'package:coding_assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:coding_assignment/core/injection_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(repo: di.sl()),
    );
  }
}
