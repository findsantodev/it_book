import 'package:mobx/mobx.dart';

part 'web_store.g.dart';

class WebStore = _WebStore with _$WebStore;

enum WebState { loading, success, error }

abstract class _WebStore with Store {
  _WebStore();

  @observable
  WebState webState = WebState.loading;

  @observable
  String? title = '';

  Future init() async {
    webState = WebState.loading;
  }
}
