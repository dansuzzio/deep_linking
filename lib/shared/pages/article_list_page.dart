import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleListPage extends StatelessWidget {
  final String topic;
  final bool isLoading;
  final List<Article> articles;
  final void Function() sortByDate;
  final void Function() sortByTitle;
  final Future<void> Function() createArticle;
  final Future<void> Function(Article article) deleteArticle;
  final void Function(Article article) showDetails;

  const ArticleListPage({
    super.key,
    required this.topic,
    required this.isLoading,
    required this.articles,
    required this.sortByDate,
    required this.sortByTitle,
    required this.createArticle,
    required this.deleteArticle,
    required this.showDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
        actions: [
          // Sort by date
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: sortByDate,
          ),

          // Sort by title
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: sortByTitle,
          ),

          // New article button
          IconButton(icon: const Icon(Icons.add), onPressed: createArticle),
        ],
      ),

      // Topics list
      body: isLoading
          ? const LinearProgressIndicator()
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  // Title
                  title: Text(article.title),

                  // Date
                  subtitle: Text(article.date.toString()),

                  // Delete button
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteArticle(article),
                  ),

                  // Action: go to article details page
                  onTap: () => showDetails(article),
                );
              },
            ),
    );
  }
}
