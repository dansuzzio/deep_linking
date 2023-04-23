import 'package:faker/faker.dart';

import '../models/article.dart';

abstract class ArticlesRepository {
  static final _articles = List.generate(
    10,
    (index) => Article(
      topic: 'Animals',
      title: faker.animal.name(),
      date: faker.date.dateTime(minYear: 2010, maxYear: 2022),
      content: faker.lorem.sentences(10).join(' '),
    ),
  );

  static List<Article> get articles => _articles;

  static void addArticle(Article article) => _articles.add(article);

  static void removeArticle(Article article) => _articles.remove(article);

  static Article? getArticleFromTopicByTitle(String topic, String title) {
    try {
      return _articles.firstWhere((article) => article.topic == topic && article.title == title);
    } catch (error) {
      return null;
    }
  }
}
