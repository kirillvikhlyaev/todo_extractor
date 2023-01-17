import 'package:example/example.dart' as example;

/// just copy that and past into terminal: dart run todo_extractor -s bin -s lib -o todo.md
///                                                                 | - sources   | - output file

void main(List<String> arguments) {
  print('Hello world: ${example.multiply()}!');
  // TODO: Add more features to my calculator
  // * division
  // * addition
  // * subtraction
}

// TODO: Get numbers from args with https://pub.dev/packages/args  
