import '../models/article.dart';

abstract class ArticleDetailsPageState {
  bool get isLoading;
  Article? get article;
}
