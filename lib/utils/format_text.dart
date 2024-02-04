import 'package:text_plus/text_plus_type_entity.dart';

/// split text enclosed in pattern into a list if needed
List<Map> formatText(String fullText) {
  final splitedText = splitAllPattern(fullText);
  final List<Map> formattedText = [];
  for (final String text in splitedText) {
    bool hadMatch = false;
    for (final TextPlusType type in TextPlusType.values) {
      if (type == TextPlusType.none) continue;
      final regex = RegExp(type.pattern);
      if (text.contains(regex)) {
        hadMatch = true;
        final matches = regex.allMatches(text);
        int start = 0;
        for (final match in matches) {
          if (start != match.start) {
            formattedText.add({
              'text': text.substring(start, match.start),
              'type': TextPlusType.none
            });
          }

          formattedText.add({
            'text': text.substring(
              match.start + type.charactersToBeRemoved.first.length,
              match.end - type.charactersToBeRemoved.first.length,
            ),
            'type': type
          });
          start = match.end;
        }
        if (start != text.length) {
          formattedText.add({
            'text': text.substring(start, text.length),
            'type': TextPlusType.none
          });
        }
      }
    }
    if (!hadMatch) {
      formattedText.add({'text': text, 'type': TextPlusType.none});
      hadMatch = false;
    }
  }
  return formattedText;
}

/// split text into a list of strings when having a pattern
List<String> splitText(String pattern, List<String> formattedText) {
  final regex = RegExp(pattern);
  final List<String> splitedText = [];
  for (final String text in formattedText) {
    if (text.contains(regex)) {
      final matches = regex.allMatches(text);
      int start = 0;
      for (final match in matches) {
        if (start != match.start) {
          splitedText.add(text.substring(start, match.start));
        }
        splitedText.add(text.substring(match.start, match.end));
        start = match.end;
      }
      if (start != text.length) {
        splitedText.add(text.substring(start, text.length));
      }
    } else {
      splitedText.add(text);
    }
  }
  return splitedText;
}

/// split all pattern in text into a list of strings
List<String> splitAllPattern(String text) {
  List<String> formattedText = [text];
  for (final TextPlusType type in TextPlusType.values) {
    if (type == TextPlusType.none) continue;
    formattedText = splitText(type.pattern, formattedText);
  }
  return formattedText;
}
