import 'package:get/get.dart';

import '../models/article.dart';
import '../repositories/articles_repository.dart';
import '../states/article_details_page_state.dart';

class ArticleDetailsPageGetxController extends GetxController implements ArticleDetailsPageState {
  final String topic;
  final String title;

  ArticleDetailsPageGetxController({required this.topic, required this.title});

  Article? _article;
  @override
  Article? get article => _article;
  set article(Article? value) {
    _article = value;
    update();
  }

  var _isLoading = true;
  @override
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _getArticle();
  }

  Future<void> _getArticle() async {
    isLoading = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      final responseArticle = ArticlesRepository.getArticleFromTopicByTitle(topic, title);
      article = responseArticle;
    } catch (error) {
      print(error);
    } finally {
      isLoading = false;
    }
  }
}
