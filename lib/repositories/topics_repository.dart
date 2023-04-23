abstract class TopicsRepository {
  static final _topics = [
    'Movies',
    'TV Series',
    'Books',
    'Food',
    'Music',
    'Travel',
  ];

  static List<String> get topics => _topics;

  static void addTopic(String topic) => _topics.add(topic);

  static void removeTopic(String topic) => _topics.remove(topic);
}
