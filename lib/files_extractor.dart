import 'dart:io';

import 'package:file/local.dart' as l;
import 'package:glob/glob.dart';

Set<String> extractFilesPath(Iterable<String> sources) {
  try {
    return sources.expand((directory) {
      if (Platform.isWindows) {
        return Directory('$directory\\').listSync(recursive: true).whereType<File>().map((entity) {
          return entity.path;
        });
      } else {
        return Glob('$directory/**.dart')
            .listFileSystemSync(
              const l.LocalFileSystem(),
              followLinks: false,
            )
            .whereType<File>()
            .map((entity) => entity.path);
      }
    }).toSet();
  } catch (e) {
    rethrow;
  }
}
