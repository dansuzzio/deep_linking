import 'package:get/get.dart';

import '../repositories/topics_repository.dart';
import '../states/topics_page_state.dart';

class TopicsPageGetxController extends GetxController implements TopicsPageState {
  var _topics = <String>[];
  @override
  List<String> get topics => _topics;

  var _isAscendingOrder = true;

  @override
  void onInit() {
    super.onInit();
    _topics = TopicsRepository.topics;
    sortTopics(false);
  }

  @override
  void sortTopics([bool switchDirection = true]) {
    if (switchDirection) _isAscendingOrder = !_isAscendingOrder;
    _topics.sort((a, b) => _isAscendingOrder ? a.compareTo(b) : b.compareTo(a));
    update();
  }

  @override
  Future<void> createTopic() async {
    final topic = await Get.toNamed('/create', arguments: 'Topic', id: 1);
    if (topic != null && !TopicsRepository.topics.contains(topic)) {
      TopicsRepository.addTopic(topic as String);
      sortTopics(false);
      update();
    }
  }

  @override
  Future<void> deleteTopic(String topic) async {
    TopicsRepository.removeTopic(topic);
    update();
  }

  @override
  void showTopicArticles(String topic) {
    Get.toNamed('/topics/$topic', id: 1);
  }
}
