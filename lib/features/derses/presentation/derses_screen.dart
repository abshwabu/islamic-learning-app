import 'package:flutter/material.dart';

class DersesScreen extends StatelessWidget {
  const DersesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Derses')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 0,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => const SizedBox.shrink(),
      ),
    );
  }
}
