import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/article.dart';
import '../pages/article_list_page.dart';
import '../repositories/articles_repository.dart';
import '../states/article_list_page_state.dart';

class ArticleListPageBuilder extends StatefulWidget {
  final String topic;
  const ArticleListPageBuilder({super.key, required this.topic});

  @override
  State<ArticleListPageBuilder> createState() => _ArticleListPageBuilderState();
}

class _ArticleListPageBuilderState extends State<ArticleListPageBuilder> implements ArticleListPageState {
  @override
  String get topic => widget.topic;

  final _articles = <Article>[];
  @override
  List<Article> get articles => _articles;

  var _isLoading = true;
  @override
  bool get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  Future<void> _getArticles() async {
    _isLoading = true;
    try {
      // await Future.delayed(const Duration(seconds: 1));
      final loadedArticles = ArticlesRepository.articles.where((article) => article.topic == topic);
      _articles.assignAll(loadedArticles);
      // _sortArtiles(_sortedBy);
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
    }
  }

  @override
  Future<void> createArticle() async {}

  @override
  Future<void> deleteArticle(Article article) async {}

  @override
  void showDetails(Article article) {}

  @override
  void sortByDate() {}

  @override
  void sortByTitle() {}

  @override
  Widget build(BuildContext context) {
    return ArticleListPage(
      topic: topic,
      articles: articles,
      isLoading: isLoading,
      sortByTitle: sortByTitle,
      sortByDate: sortByDate,
      createArticle: createArticle,
      deleteArticle: deleteArticle,
      showDetails: showDetails,
    );
  }
}
