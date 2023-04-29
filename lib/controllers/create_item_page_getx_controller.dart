import 'package:get/get.dart';

import '../states/create_item_page_state.dart';

class CreateItemPageGetxController extends GetxController implements CreateItemPageState {
  @override
  final String title;

  CreateItemPageGetxController({required this.title});

  String? _item;
  @override
  String? get item => _item;
  set item(String? value) {
    _item = value;
    update();
  }

  @override
  void onItemChanged(String value) => item = value;

  @override
  void cancel() => Get.back(id: 1);

  @override
  void submit() => Get.back(result: _item, id: 1);
}
