abstract class PalmCodeBaseNavigationComponent<T> {
  T get dashboard;
  T get favorite;

  List<T> get orderOfItems => [
        dashboard,
        favorite,
      ];

  int get numberOfItems => orderOfItems.length;

  T get(int index) {
    assert(index >= 0 && index < orderOfItems.length);
    return orderOfItems[index];
  }
}
