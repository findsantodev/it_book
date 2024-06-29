import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/src/home/home_store.dart';
import 'package:palm_code/src/home/navigation/app_bar.dart';
import 'package:palm_code/src/home/navigation/main/body.dart';
import 'package:palm_code/src/home/navigation/main/bottom_navigation_bar.dart';
import 'package:palm_code/src/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  @override
  void initState() {
    _homeStore = GetIt.instance.get<HomeStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final int selectedIndex = _homeStore.selectedIndex;
        return Scaffold(
          appBar: AppBarWidget(
            showDivider: false,
            title: AppBarTitleStringResKey.instance.get(selectedIndex),
            customLeading: true,
          ),
          body:
              PalmCodeNavigationBarBody.instance.get(_homeStore.selectedIndex),
          bottomNavigationBar: PalmCodeBottomNavigationBar(
            currentIndex: _homeStore.selectedIndex,
            onBottomBarItemTapped: _homeStore.onBottomBarItemTapped,
          ),
        );
      },
    );
  }
}
