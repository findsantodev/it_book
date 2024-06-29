import 'package:mobx/mobx.dart';
import 'package:palm_code/src/home/navigation/app_bar.dart';

part 'home_store.g.dart';

enum HomeState { loading, success, error }

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore();

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
