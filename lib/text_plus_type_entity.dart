import 'package:flutter/widgets.dart';

enum TextPlusType {
  none('', []),
  bold(r'\*(.*?)\*', ['*']),
  italic(r'_(.*?)_', ['_']),
  underline(r'\.\.(.*?)\.\.', ['..']),
  strikethrough(r'~(.*?)~', ['~']);

  const TextPlusType(this.pattern, this.charactersToBeRemoved);
  final String pattern;

  /// characters in the pattern to be removed from the text
  final List<String> charactersToBeRemoved;
}

extension TextPlusTypeExtension on TextPlusType {
  TextSpan getSpan(String text) {
    return {
      'none': TextSpan(text: text),
      'bold': TextSpan(
        text: text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      'italic': TextSpan(
        text: text,
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      'underline': TextSpan(
        text: text,
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
      'strikethrough': TextSpan(
        text: text,
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      ),
    }[name]!;
  }
}
