class Todo {
  String? fileName;
  String? line;
  String? content;

  Todo({this.content, this.fileName, this.line});

  void addContent(String newContent) {
    content = '$content\n$newContent';
  }

  String prepared(bool isMD) {
    if (isMD) {
      return '**[$fileName]($fileName): $line**\n$content\n\n';
    } else {
      return '$fileName:$line\n$content\n\n';
    }
    
  }

  @override
  String toString() {
    return '**$fileName: $line**\n$content\n\n';
  }
}
