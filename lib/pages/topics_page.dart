import 'package:flutter/material.dart';

import '../states/topics_page_state.dart';

class TopicsPage extends StatelessWidget {
  final TopicsPageState state;

  const TopicsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        actions: [
          // Sort button
          IconButton(icon: const Icon(Icons.sort_by_alpha), onPressed: state.sortTopics),

          // New topic button
          IconButton(icon: const Icon(Icons.add), onPressed: state.createTopic),
        ],
      ),

      // Topics list
      body: ListView.builder(
        itemCount: state.topics.length,
        itemBuilder: (context, index) {
          final topic = state.topics[index];
          return ListTile(
            // Title
            title: Text(topic),

            // Delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => state.deleteTopic(topic),
            ),

            // Action: go to articles page
            onTap: () => state.showTopicArticles(topic),
          );
        },
      ),
    );
  }
}
