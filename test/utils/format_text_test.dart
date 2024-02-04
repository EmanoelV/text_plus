import 'package:flutter_test/flutter_test.dart';
import 'package:text_plus/text_plus_type_entity.dart';
import 'package:text_plus/utils/format_text.dart';

void main() {
  test('Should return ["hello ", "*world*","! this is a ", "*bold*", " text"]',
      () {
    const text = 'hello *world*! this is a *bold* text';
    final formattedText = splitText(TextPlusType.bold.pattern, [text]);
    expect(formattedText,
        ['hello ', '*world*', '! this is a ', '*bold*', ' text']);
  });

  test('Should return ["hello ", "_world_","! this is a ", "*bold*", " text"]',
      () {
    const text = 'hello _world_! this is a *bold* text';
    final formattedText = splitAllPattern(text);
    expect(formattedText,
        ['hello ', '_world_', '! this is a ', '*bold*', ' text']);
  });

  test('should return a corret list', () {
    const text = 'hello _world_! this is a *bold* text';
    final formattedText = formatText(text);
    expect(formattedText, [
      {'text': 'hello ', 'type': TextPlusType.none},
      {'text': 'world', 'type': TextPlusType.italic},
      {'text': '! this is a ', 'type': TextPlusType.none},
      {'text': 'bold', 'type': TextPlusType.bold},
      {'text': ' text', 'type': TextPlusType.none}
    ]);
  });
}
