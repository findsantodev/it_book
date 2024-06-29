import 'package:flutter/material.dart';
import 'package:palm_code/src/books/book_detail.dart';
import 'package:palm_code/src/books/books_page.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/favorite/favorite_page.dart';
import 'package:palm_code/src/home/home_page.dart';
import 'package:palm_code/src/splash/splash_page.dart';
import 'package:palm_code/src/web/web_page.dart';

class NavigationService {
  static const routeSplash = 'splash';
  static const routeHome = 'home';
  static const routeBooks = 'books';
  static const routeBookDetail = 'book_detail';
  static const routeFavorite = 'favorite';
  static const routeWeb = "web";

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
      case routeHome:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
          maintainState: false,
        );
      case routeBooks:
        return MaterialPageRoute(
          builder: (_) => BooksPage(
            booksDashboardFilter: settings.arguments as BooksDashboardFilter?,
          ),
          settings: settings,
          maintainState: false,
        );
      case routeBookDetail:
        return MaterialPageRoute(
          builder: (_) => BookDetail(
            bookItem: settings.arguments as BookItem?,
          ),
          settings: settings,
          maintainState: false,
        );
      case routeFavorite:
        return MaterialPageRoute(
          builder: (_) => const FavoritePage(),
          settings: settings,
          maintainState: false,
        );
      case routeWeb:
        return MaterialPageRoute(
          builder: (_) => WebPage(url: settings.arguments as String?),
          settings: settings,
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
