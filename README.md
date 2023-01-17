# TODO Extractor

[![pub package](https://img.shields.io/badge/pub-1.0.0-blue.svg)](https://pub.dev/packages/todo_extractor)

Script for fetch your TODO marks

This package will allow you to pull your TODOs into a independent file in the root directory.

## Installing

You need to add this package in `pubspec.yaml` and run `flutter pub get` in terminal:

```yaml
dependencies:
    todo_extractor: ^1.0.0
```

## How to use it?

To fetch TODOs (if they exist), write the following command in the terminal:

```
    flutter pub todo_extractor -s lib -o todo.txt
```

* **-s** - sources, it can be a directory or files
* **-o** - the output file, it can be a file with the extension
.txt or .md (the latter has several advantages).

After that, you can open the generated file and look at your TODOs

* todo.**txt**

<p align="center">
    <img src="https://github.com/kirillvikhlyaev/todo_extractor/blob/main/assets/demo_txt.PNG" alt="theory" width="80%"/>
</p>

* todo.**md**

<p align="center">
    <img src="https://github.com/kirillvikhlyaev/todo_extractor/blob/main/assets/demo_md.PNG" alt="theory" width="80%"/>
</p>

> ⚠️ To fetch TODO, you need the line to start with "// TODO:"

## What are the advantages of MD file?

1. A table is generated in the md file, where one row is one file, which is convenient for perception
1. In the cell, the file name is a link that, when clicked, sends to this file
1. There is also the date of generation of this file, which will allow you to understand how relevant the information is.

