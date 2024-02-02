library text_plus;

import 'package:flutter/widgets.dart';
import 'package:text_plus/text_plus_type_entity.dart';
import 'package:text_plus/utils/format_text.dart';

class TextPlus extends StatelessWidget {
  final String text;
  const TextPlus(this.text, {super.key});

  /// build text with formatted text
  List<InlineSpan> _buildText(String text) {
    final List<Map> formattedText = formatText(text);
    final List<TextSpan> textSpans = [];
    for (final Map text in formattedText) {
      if (text['type'] == TextPlusType.bold) {
        textSpans.add(
          TextSpan(
            text: text['text'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else {
        textSpans.add(TextSpan(text: text['text']));
      }
    }
    return textSpans;
  }

  @override
  Widget build(BuildContext context) =>
      Text.rich(TextSpan(children: _buildText(text)));
}
