import 'package:flutter/widgets.dart';
import 'package:palm_code/src/dashboard/dashboard_page.dart';
import 'package:palm_code/src/favorite/favorite_page.dart';
import 'package:palm_code/src/home/navigation/main/base.dart';

class PalmCodeNavigationBarBody
    extends PalmCodeBaseNavigationComponent<Widget> {
  PalmCodeNavigationBarBody._();

  static PalmCodeNavigationBarBody instance = PalmCodeNavigationBarBody._();

  final Widget _dashboard = const DashboardPage();

  @override
  Widget get dashboard => _dashboard;

  final Widget _favorite = const FavoritePage();

  @override
  Widget get favorite => _favorite;
}
