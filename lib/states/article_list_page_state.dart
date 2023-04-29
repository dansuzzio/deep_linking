import '../models/article.dart';

abstract class ArticleListPageState {
  String get topic;
  bool get isLoading;
  List<Article> get articles;

  void sortByDate();
  void sortByTitle();
  Future<void> createArticle();
  Future<void> deleteArticle(Article article);
  void showDetails(Article article);
}
