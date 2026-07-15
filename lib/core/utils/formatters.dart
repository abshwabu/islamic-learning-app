String formatDuration(int seconds) {
  if (seconds <= 0) return '--:--';
  final minutes = seconds ~/ 60;
  final remainingSeconds = seconds % 60;
  if (minutes >= 60) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '$hours:${mins.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}

String formatPageRange(int startPage, int endPage) {
  if (endPage <= 0) return 'p. $startPage';
  return 'pp. $startPage–$endPage';
}
