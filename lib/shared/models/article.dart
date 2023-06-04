class Article {
  final String topic;
  final String title;
  final DateTime date;
  final String content;

  Article({
    required this.topic,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  operator ==(other) => other is Article && other.topic == topic && other.title == title;

  @override
  int get hashCode => topic.hashCode ^ title.hashCode;
}
