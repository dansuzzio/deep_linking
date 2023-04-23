import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';
import '../repositories/articles_repository.dart';

class ArticleListPage extends StatefulWidget {
  final String topic;
  const ArticleListPage({super.key, required this.topic});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

enum _SortBy { titleAscending, titleDescending, dateAscending, dateDescending }

class _ArticleListPageState extends State<ArticleListPage> {
  var _filteredArticles = <Article>[];
  var _sortedBy = _SortBy.dateDescending;

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  void _getArticles() {
    _filteredArticles = ArticlesRepository.articles.where((article) => article.topic == widget.topic).toList();
    _sortArticles(_sortedBy);
  }

  void _sortArticles(_SortBy sortBy) {
    switch (sortBy) {
      case _SortBy.titleAscending:
        _filteredArticles.sort((a, b) => a.title.compareTo(b.title));
        break;
      case _SortBy.titleDescending:
        _filteredArticles.sort((a, b) => b.title.compareTo(a.title));
        break;
      case _SortBy.dateAscending:
        _filteredArticles.sort((a, b) => a.date.compareTo(b.date));
        break;
      case _SortBy.dateDescending:
        _filteredArticles.sort((a, b) => b.date.compareTo(a.date));
        break;
    }
    setState(() => _sortedBy = sortBy);
  }

  Future<void> _addArticle() async {
    final title = await Navigator.of(context).pushNamed('/new', arguments: 'Article');
    if (title != null) {
      final article = Article(
        topic: widget.topic,
        title: title as String,
        date: DateTime.now(),
        content: faker.lorem.sentences(3).join(' '),
      );
      if (ArticlesRepository.articles.contains(article)) return;
      ArticlesRepository.addArticle(article);
      setState(() => _getArticles());
    }
  }

  void _deleteArticle(Article article) {
    ArticlesRepository.removeArticle(article);
    setState(() => _getArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic),
        actions: [
          // Sort by date
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => _sortArticles(
              _sortedBy == _SortBy.dateDescending ? _SortBy.dateAscending : _SortBy.dateDescending,
            ),
          ),

          // Sort by title
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: () => _sortArticles(
              _sortedBy == _SortBy.titleAscending ? _SortBy.titleDescending : _SortBy.titleAscending,
            ),
          ),

          // New article button
          IconButton(icon: const Icon(Icons.add), onPressed: _addArticle),
        ],
      ),

      // Topics list
      body: ListView.builder(
        itemCount: _filteredArticles.length,
        itemBuilder: (context, index) {
          final article = _filteredArticles[index];
          return ListTile(
            // Title
            title: Text(article.title),

            // Date
            subtitle: Text(article.date.toString()),

            // Delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteArticle(article),
            ),

            // Action: go to article details page
            onTap: () => Navigator.of(context).pushNamed('/article', arguments: article),
          );
        },
      ),
    );
  }
}
