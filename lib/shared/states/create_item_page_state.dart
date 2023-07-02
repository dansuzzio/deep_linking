abstract class CreateItemPageState {
  String get title;
  String? get item;
  void onItemChanged(String value);
  void submit();
  void cancel();
}
