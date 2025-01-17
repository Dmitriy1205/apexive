String formatDuration(int duration) {
  final hours = duration ~/ 3600;
  final minutes = (duration ~/ 60) % 60;
  final seconds = duration % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
