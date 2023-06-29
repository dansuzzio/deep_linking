import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/top_routes.dart';
import '../pages/topics_page.dart';
import '../repositories/topics_repository.dart';
import '../states/app_navigation_state.dart';
import '../states/topics_page_state.dart';

class TopicsPageBuilder extends StatefulWidget {
  const TopicsPageBuilder({super.key});

  @override
  State<TopicsPageBuilder> createState() => _TopicsPageBuilderState();
}

class _TopicsPageBuilderState extends State<TopicsPageBuilder> implements TopicsPageState {
  final _navigation = GetIt.I.get<AppNavigationState>(instanceName: 'topics');

  var _topics = <String>[];
  @override
  List<String> get topics => _topics;

  @override
  Future<void> createTopic() async {}

  @override
  Future<void> deleteTopic(String topic) async {}

  @override
  void sortTopics() {}

  @override
  void showTopicArticles(String topic) {
    _navigation.goTo(Routes.articles(topic: topic));
  }

  @override
  void initState() {
    super.initState();
    _topics = TopicsRepository.topics;
  }

  @override
  Widget build(BuildContext context) {
    return TopicsPage(
      topics: _topics,
      createTopic: createTopic,
      deleteTopic: deleteTopic,
      showTopicArticles: showTopicArticles,
      sortTopics: sortTopics,
    );
  }
}
