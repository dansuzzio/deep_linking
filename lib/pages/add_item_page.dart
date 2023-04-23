import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  final String title;

  const AddItemPage({super.key, required this.title});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  String? _item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New ${widget.title}')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter item name',
              contentPadding: EdgeInsets.all(20),
            ),
            textCapitalization: TextCapitalization.words,
            onChanged: (value) => setState(() => _item = value),
            onSubmitted: (value) => Navigator.of(context).pop(value),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(_item),
            child: const Text('Create'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
