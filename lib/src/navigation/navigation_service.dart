import 'package:flutter/material.dart';
import 'package:palm_code/src/books/books_page.dart';
import 'package:palm_code/src/splash/splash_page.dart';

class NavigationService {
  static const routeSplash = 'splash';
  static const routeBooks = 'books';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pop<T>([T? value]) {
    return navigatorKey.currentState!.pop<T>(value);
  }

  Future<T?> push<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed<T>(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacement(String routeName, {Object? arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  Future<dynamic> clearStackAndPush(String routeName) async {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case routeBooks:
        return MaterialPageRoute(
          builder: (_) => const BooksPage(),
          settings: settings,
          maintainState: false,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
