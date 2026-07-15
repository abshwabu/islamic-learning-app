import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfx/pdfx.dart';

import '../../../core/utils/formatters.dart';
import '../models/player_session_state.dart';
import '../providers/player_session_notifier.dart';
import 'widgets/player_controls.dart';

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key, this.episodeId});

  final String? episodeId;

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  PdfControllerPinch? _pdfController;
  int? _loadedPdfVersion;
  int? _loadedTargetPage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrapEpisode());
  }

  @override
  void didUpdateWidget(covariant PlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.episodeId != widget.episodeId) {
      _bootstrapEpisode();
    }
  }

  void _bootstrapEpisode() {
    final rawId = widget.episodeId;
    if (rawId == null) return;
    final episodeId = int.tryParse(rawId);
    if (episodeId == null) return;
    ref.read(playerSessionProvider.notifier).loadEpisode(episodeId);
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  Future<void> _ensurePdfController(PlayerSessionState session) async {
    final pdfPath = session.pdfPath;
    if (pdfPath == null) return;

    final needsNewController =
        _pdfController == null || _loadedPdfVersion != session.pdfVersion;

    if (needsNewController) {
      _pdfController?.dispose();
      _pdfController = PdfControllerPinch(
        document: PdfDocument.openFile(pdfPath),
        initialPage: session.pdfTargetPage,
      );
      _loadedPdfVersion = session.pdfVersion;
      _loadedTargetPage = session.pdfTargetPage;
      if (mounted) setState(() {});
      return;
    }

    if (_loadedTargetPage != session.pdfTargetPage) {
      _loadedTargetPage = session.pdfTargetPage;
      _pdfController?.jumpToPage(session.pdfTargetPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(playerSessionProvider);

    ref.listen(playerSessionProvider, (previous, next) {
      if (previous?.pdfTargetPage != next.pdfTargetPage ||
          previous?.pdfVersion != next.pdfVersion) {
        _ensurePdfController(next);
      }
    });

    if (session.pdfPath != null &&
        (_loadedPdfVersion != session.pdfVersion ||
            _loadedTargetPage != session.pdfTargetPage)) {
      _ensurePdfController(session);
    }

    final episode = session.episode;
    final ders = session.ders;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(episode?.title ?? 'Player'),
            if (ders != null)
              Text(
                ders.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
      body: session.isLoading && !session.hasEpisode
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: _buildPdfPanel(session),
                ),
                if (episode != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${formatDuration(episode.durationSeconds)} · ${formatPageRange(episode.startPage, episode.endPage)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: PlayerControls(),
                ),
              ],
            ),
    );
  }

  Widget _buildPdfPanel(PlayerSessionState session) {
    if (session.errorMessage != null && session.pdfPath == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(session.errorMessage!),
        ),
      );
    }

    if (_pdfController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return PdfViewPinch(
      controller: _pdfController!,
      padding: 8,
    );
  }
}
