import 'package:flutter/material.dart';

import '../states/article_list_page_state.dart';

class ArticleListPage extends StatelessWidget {
  final ArticleListPageState state;

  const ArticleListPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.topic),
        actions: [
          // Sort by date
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: state.sortByDate,
          ),

          // Sort by title
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: state.sortByTitle,
          ),

          // New article button
          IconButton(icon: const Icon(Icons.add), onPressed: state.createArticle),
        ],
      ),

      // Topics list
      body: state.isLoading
          ? const LinearProgressIndicator()
          : ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ListTile(
                  // Title
                  title: Text(article.title),

                  // Date
                  subtitle: Text(article.date.toString()),

                  // Delete button
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => state.deleteArticle(article),
                  ),

                  // Action: go to article details page
                  onTap: () => state.showDetails(article),
                );
              },
            ),
    );
  }
}
