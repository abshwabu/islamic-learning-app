import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/formatters.dart';
import '../../providers/player_session_notifier.dart';

class PlayerControls extends ConsumerWidget {
  const PlayerControls({super.key});

  static const _speedOptions = [0.75, 1.0, 1.25, 1.5, 2.0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(playerSessionProvider);
    final notifier = ref.read(playerSessionProvider.notifier);
    final player = notifier.player;

    return Column(
      children: [
        StreamBuilder<Duration>(
          stream: player.positionStream,
          builder: (context, positionSnapshot) {
            return StreamBuilder<Duration?>(
              stream: player.durationStream,
              builder: (context, durationSnapshot) {
                final position = positionSnapshot.data ?? Duration.zero;
                final duration = durationSnapshot.data ?? Duration.zero;
                final maxMs = duration.inMilliseconds > 0
                    ? duration.inMilliseconds.toDouble()
                    : 1.0;

                return Column(
                  children: [
                    Slider(
                      value: position.inMilliseconds
                          .clamp(0, maxMs.toInt())
                          .toDouble(),
                      max: maxMs,
                      onChanged: session.isLoading
                          ? null
                          : (value) => notifier.seek(
                                Duration(milliseconds: value.round()),
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatDuration(position.inSeconds)),
                          Text(formatDuration(duration.inSeconds)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: session.hasPrevious && !session.isLoading
                  ? notifier.skipPrevious
                  : null,
              icon: const Icon(Icons.skip_previous),
              iconSize: 32,
            ),
            const SizedBox(width: 8),
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return IconButton.filled(
                  onPressed:
                      session.isLoading ? null : notifier.togglePlayPause,
                  iconSize: 40,
                  icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed:
                  session.hasNext && !session.isLoading ? notifier.skipNext : null,
              icon: const Icon(Icons.skip_next),
              iconSize: 32,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            PopupMenuButton<double>(
              tooltip: 'Playback speed',
              onSelected: notifier.setSpeed,
              itemBuilder: (context) => _speedOptions
                  .map(
                    (speed) => PopupMenuItem(
                      value: speed,
                      child: Text('${speed}x'),
                    ),
                  )
                  .toList(),
              child: Chip(
                avatar: const Icon(Icons.speed, size: 18),
                label: Text('${session.playbackSpeed}x'),
              ),
            ),
            PopupMenuButton<Duration?>(
              tooltip: 'Sleep timer',
              onSelected: notifier.setSleepTimer,
              itemBuilder: (context) => const [
                PopupMenuItem(value: null, child: Text('Off')),
                PopupMenuItem(
                  value: Duration(minutes: 5),
                  child: Text('5 minutes'),
                ),
                PopupMenuItem(
                  value: Duration(minutes: 15),
                  child: Text('15 minutes'),
                ),
                PopupMenuItem(
                  value: Duration(minutes: 30),
                  child: Text('30 minutes'),
                ),
                PopupMenuItem(
                  value: Duration(minutes: 45),
                  child: Text('45 minutes'),
                ),
                PopupMenuItem(
                  value: Duration(hours: 1),
                  child: Text('1 hour'),
                ),
              ],
              child: Chip(
                avatar: const Icon(Icons.bedtime_outlined, size: 18),
                label: Text(
                  session.sleepTimerEndsAt == null
                      ? 'Sleep timer'
                      : 'Sleep ${_formatSleepRemaining(session.sleepTimerEndsAt!)}',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatSleepRemaining(DateTime endsAt) {
    final remaining = endsAt.difference(DateTime.now());
    if (remaining.isNegative) return '0m';
    if (remaining.inHours > 0) return '${remaining.inHours}h';
    return '${remaining.inMinutes}m';
  }
}
