/// Simple date formatter, output date in formL: YYYY-MM-DD
String formattedDate() {
  final today = DateTime.now();
  return '${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
}
