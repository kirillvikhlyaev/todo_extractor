import 'dart:io';

import 'package:file/local.dart';
import 'package:glob/glob.dart';

/// Depending on the platform, it runs through the directory from sources and returns all files with the .dart extension
Set<String> extractFilesPath(Iterable<String> sources) {
  try {
    return sources.expand((directory) {
      if (Platform.isWindows) {
        return Directory('$directory\\')
            .listSync(recursive: true)
            .whereType<File>()
            .map((file) {
          return file.path;
        });
      } else {
        return Glob('$directory/**.dart')
            .listFileSystemSync(
              const LocalFileSystem(),
              followLinks: false,
            )
            .whereType<File>()
            .map((file) => file.path);
      }
    }).toSet();
  } catch (e) {
    print('|\n| ❌\tData collection failed');
    rethrow;
  }
}
