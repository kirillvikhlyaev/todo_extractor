/// TODO model
class Todo {
  String? fileName;
  String? line;
  String? content;

  Todo({this.content, this.fileName, this.line});

  void addContent(String newContent) {
    content = '$content, $newContent';
  }

  /// If output file is MD, that makes a table out of TODO
  String prepared(bool isMD) {
    if (isMD) {
      return '| **[$fileName]($fileName): $line** | $content |\n';
    } else {
      return '$fileName:$line\n$content\n\n';
    }
  }

  @override
  String toString() {
    return '**$fileName: $line**\n$content\n\n';
  }
}
