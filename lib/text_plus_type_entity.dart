import 'package:flutter/widgets.dart';

enum TextPlusType {
  none(''),
  bold(r'\*(.*?)\*'),
  italic(r'_(.*?)_');

  const TextPlusType(this.pattern);
  final String pattern;
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
    }[name]!;
  }
}
