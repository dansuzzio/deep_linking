import 'package:flutter/material.dart';

import '../models/article.dart';
import '../repositories/articles_repository.dart';

class ArticleDetailsPage extends StatefulWidget {
  final String topic;
  final String title;
  const ArticleDetailsPage({super.key, required this.topic, required this.title});

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Article? _article;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getArticle();
  }

  Future<void> _getArticle() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    final article = ArticlesRepository.getArticleFromTopicByTitle(widget.topic, widget.title);
    if (mounted) {
      setState(() {
        _article = article;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _isLoading
          ? const LinearProgressIndicator()
          : _article != null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(_article!.content),
                )
              : Container(),
    );
  }
}
