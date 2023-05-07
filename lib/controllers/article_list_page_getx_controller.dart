import 'package:faker/faker.dart';
import 'package:get/get.dart';

import '../models/article.dart';
import '../models/topics_routes.dart';
import '../repositories/articles_repository.dart';
import '../states/app_navigation_state.dart';
import '../states/article_list_page_state.dart';

enum _SortBy { titleAscending, titleDescending, dateAscending, dateDescending }

class ArticleListPageGetxController extends GetxController implements ArticleListPageState {
  // @override
  // final String topic;

  // ArticleListPageGetxController({required this.topic});

  final AppNavigationState navigation;

  ArticleListPageGetxController({required this.navigation});

  @override
  String get topic => Uri.parse(navigation.currentRoute.path ?? '').pathSegments.last;

  var _articles = <Article>[];

  @override
  List<Article> get articles => _articles;

  var _isLoading = true;
  @override
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  var _sortedBy = _SortBy.dateDescending;

  @override
  void onInit() {
    super.onInit();
    _getArticles();
  }

  Future<void> _getArticles() async {
    isLoading = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      _articles = ArticlesRepository.articles.where((article) => article.topic == topic).toList();
      _sortArtiles(_sortedBy);
    } catch (error) {
      print(error);
    } finally {
      isLoading = false;
    }
  }

  @override
  void sortByDate() {
    if (_sortedBy == _SortBy.dateDescending) {
      _sortArtiles(_SortBy.dateAscending);
    } else {
      _sortArtiles(_SortBy.dateDescending);
    }
  }

  @override
  void sortByTitle() {
    if (_sortedBy == _SortBy.titleDescending) {
      _sortArtiles(_SortBy.titleAscending);
    } else {
      _sortArtiles(_SortBy.titleDescending);
    }
  }

  void _sortArtiles(_SortBy sortBy) {
    switch (sortBy) {
      case _SortBy.titleAscending:
        _articles.sort((a, b) => a.title.compareTo(b.title));
        break;
      case _SortBy.titleDescending:
        _articles.sort((a, b) => b.title.compareTo(a.title));
        break;
      case _SortBy.dateAscending:
        _articles.sort((a, b) => a.date.compareTo(b.date));
        break;
      case _SortBy.dateDescending:
        _articles.sort((a, b) => b.date.compareTo(a.date));
        break;
    }
    _sortedBy = sortBy;
    update();
  }

  @override
  Future<void> createArticle() async {
    final title = await Get.toNamed('/create', arguments: 'Article', id: 1);
    if (title != null) {
      final article = Article(
        topic: topic,
        title: title as String,
        date: DateTime.now(),
        content: faker.lorem.sentences(3).join(' '),
      );
      if (ArticlesRepository.articles.contains(article)) return;
      ArticlesRepository.addArticle(article);
      _getArticles();
    }
  }

  @override
  Future<void> deleteArticle(Article article) async {
    ArticlesRepository.removeArticle(article);
    update();
  }

  @override
  void showDetails(Article article) {
    // Get.toNamed('/topics/$topic/${article.title}', id: 1);
    navigation.setRoute(TopicsRoutes.article(article.topic, article.title));
  }
}
