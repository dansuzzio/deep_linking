import 'package:flutter/material.dart';

import '../states/article_details_page_state.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleDetailsPageState state;

  const ArticleDetailsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: state.article != null ? Text(state.article!.title) : null),
      body: state.isLoading
          ? const LinearProgressIndicator()
          : state.article != null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(state.article!.content),
                )
              : Container(),
    );
  }
}
