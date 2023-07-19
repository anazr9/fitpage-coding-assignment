import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/models/type_model.dart';
import 'package:coding_assignment/screens/detail_screen.dart';
import 'package:coding_assignment/screens/home_screen.dart';
import 'package:coding_assignment/screens/sub_criteria_screen.dart';

import 'package:flutter/material.dart';
import 'package:coding_assignment/core/injection_container.dart' as di;

// Defining named routes for the application
class AppRoutes {
  const AppRoutes._();
  // The initial route that will be displayed when the app is launched
  static const initialRoute = '/';
  // Route for the detail screen, used to display detailed information about stock scan
  static const detailScreen = '/detail_screen';
  // Route for the sub-criteria screen, used to display additional criteria for filtering data
  static const subCriteriaScreen = '/sub_criteria_screen';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Initial route of the HomeScreen
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(repo: di.sl()),
        );
      // Route for the detail screen of the partical scan, passing the particular scan data
      case AppRoutes.detailScreen:
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            data: settings.arguments as ScanData,
          ),
        );
      //Route for the sub criteria screen
      case AppRoutes.subCriteriaScreen:
        return MaterialPageRoute(
          builder: (context) => SubCriteriaScreen(
            type: settings.arguments as VarType,
          ),
        );
      // If the requested route does not match any of the defined routes,
      default:
        throw Exception('This route name does not exit');
    }
  }
}
