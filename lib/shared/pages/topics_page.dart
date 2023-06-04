import 'package:flutter/material.dart';

class TopicsPage extends StatelessWidget {
  final List<String> topics;
  final void Function() sortTopics;
  final void Function() createTopic;
  final void Function(String topic) deleteTopic;
  final void Function(String topic) showTopicArticles;

  const TopicsPage({
    super.key,
    required this.topics,
    required this.sortTopics,
    required this.createTopic,
    required this.deleteTopic,
    required this.showTopicArticles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        actions: [
          // Sort button
          IconButton(icon: const Icon(Icons.sort_by_alpha), onPressed: sortTopics),

          // New topic button
          IconButton(icon: const Icon(Icons.add), onPressed: createTopic),
        ],
      ),

      // Topics list
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return ListTile(
            // Title
            title: Text(topic),

            // Delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTopic(topic),
            ),

            // Action: go to articles page
            onTap: () => showTopicArticles(topic),
          );
        },
      ),
    );
  }
}
