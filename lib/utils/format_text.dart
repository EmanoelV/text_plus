import 'package:text_plus/text_plus_type_entity.dart';

/// split text enclosed in pattern *into* a list if needed
List<Map> formatText(String text) {
  final splitedText = splitText(text);
  final List<Map> formattedText = [];
  for (final String text in splitedText) {
    if (text.contains(RegExp(r'\*(.*?)\*'))) {
      formattedText.add({
        'text': text.substring(1, text.length - 1),
        'type': TextPlusType.bold
      });
    } else {
      formattedText.add({'text': text, 'type': TextPlusType.none});
    }
  }
  return formattedText;
}

/// split text into a list of strings when having a pattern
List<String> splitText(String text) {
  if (text.contains(RegExp(r'\*(.*?)\*'))) {
    final boldRegex = RegExp(r'\*(.*?)\*');
    List<String> splitedText = [];
    final matches = boldRegex.allMatches(text);
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
    return splitedText;
  }
  return [text];
}
