import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Downloads')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.download_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No downloads yet'),
          ],
        ),
      ),
    );
  }
}
