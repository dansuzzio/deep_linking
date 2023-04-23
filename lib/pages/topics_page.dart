import 'package:flutter/material.dart';

import '../repositories/topics_repository.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  final _sortedTopics = TopicsRepository.topics;
  var _isAscendingOrder = true;

  @override
  void initState() {
    _sortedTopics.sort((a, b) => _isAscendingOrder ? a.compareTo(b) : b.compareTo(a));
    super.initState();
  }

  void _sortTopics({bool isSameDirection = false}) {
    if (isSameDirection) {
      setState(() => _sortedTopics.sort((a, b) => _isAscendingOrder ? a.compareTo(b) : b.compareTo(a)));
    } else {
      setState(() {
        _sortedTopics.sort((a, b) => _isAscendingOrder ? b.compareTo(a) : a.compareTo(b));
        _isAscendingOrder = !_isAscendingOrder;
      });
    }
  }

  Future<void> _addTopic() async {
    final topic = await Navigator.of(context).pushNamed('/new', arguments: 'Topic');
    if (topic != null) {
      TopicsRepository.addTopic(topic as String);
      _sortTopics(isSameDirection: true);
    }
  }

  void _deleteTopic(String topic) {
    setState(() => TopicsRepository.removeTopic(topic));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        actions: [
          // Sort button
          IconButton(icon: const Icon(Icons.sort_by_alpha), onPressed: _sortTopics),

          // New topic button
          IconButton(icon: const Icon(Icons.add), onPressed: _addTopic),
        ],
      ),

      // Topics list
      body: ListView.builder(
        itemCount: TopicsRepository.topics.length,
        itemBuilder: (context, index) {
          final topic = TopicsRepository.topics[index];
          return ListTile(
            // Title
            title: Text(topic),

            // Delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTopic(topic),
            ),

            // Action: go to articles page
            onTap: () => Navigator.of(context).pushNamed('/articles', arguments: topic),
          );
        },
      ),
    );
  }
}
