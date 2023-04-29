abstract class TopicsPageState {
  List<String> get topics;
  void sortTopics();
  Future<void> createTopic();
  Future<void> deleteTopic(String topic);
  void showTopicArticles(String topic);
}
