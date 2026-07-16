import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.binatechnologies.islamiclearning.audio',
      androidNotificationChannelName: 'Islamic Learning Playback',
      androidNotificationOngoing: true,
    );
  } on Object catch (error, stackTrace) {
    debugPrint('JustAudioBackground.init failed: $error\n$stackTrace');
  }
  runApp(
    const ProviderScope(
      child: IslamicLearningApp(),
    ),
  );
}
