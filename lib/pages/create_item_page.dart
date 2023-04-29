import 'package:flutter/material.dart';

import '../states/create_item_page_state.dart';

class CreateItemPage extends StatelessWidget {
  final CreateItemPageState state;

  const CreateItemPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New ${state.title}')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter item name',
              contentPadding: EdgeInsets.all(20),
            ),
            textCapitalization: TextCapitalization.words,
            onChanged: state.onItemChanged,
            onSubmitted: (value) => Navigator.of(context).pop(value),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: state.submit,
            child: const Text('Create'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: state.cancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
