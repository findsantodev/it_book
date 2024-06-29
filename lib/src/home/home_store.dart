import 'package:mobx/mobx.dart';
import 'package:palm_code/src/home/navigation/app_bar.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

part 'home_store.g.dart';

enum HomeState { loading, success, error }

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final NavigationService _navigationService;
  _HomeStore({
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  @observable
  HomeState booksState = HomeState.loading;

  @observable
  int selectedIndex = 0;

  @action
  void onBottomBarItemTapped(int index) {
    if (index < 0 || index >= AppBarTitleStringResKey.instance.numberOfItems) {
      throw ArgumentError("No bottom bar item with index $index");
    }
    selectedIndex = index;
  }
}
