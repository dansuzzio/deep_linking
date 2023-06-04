import 'package:faker/faker.dart';

import '../models/article.dart';

final _animals = ['Turtle', 'Koala', 'Whale', 'Panda', 'Tiger', 'Zebra', 'Penguin'];
final _books = ['The Great Gatsby', 'The Grapes of Wrath', 'Nineteen Eighty-Four', 'Ulysses', 'Lolita', 'Catch-22', 'Beloved'];
final _food = ['Pizza', 'Burger', 'Pasta', 'Salad', 'Soup', 'Sandwich', 'Steak'];

Article _getArticle(String topic, String title) => Article(
      topic: topic,
      title: title,
      date: faker.date.dateTime(minYear: 2010, maxYear: 2022),
      content: faker.lorem.sentences(10).join(' '),
    );

abstract class ArticlesRepository {
  static final _articles = [
    ...List.generate(_animals.length, (index) => _getArticle('Animals', _animals[index])),
    ...List.generate(_books.length, (index) => _getArticle('Books', _books[index])),
    ...List.generate(_food.length, (index) => _getArticle('Food', _food[index])),
  ];

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
