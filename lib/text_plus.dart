library text_plus;

import 'package:flutter/widgets.dart';
import 'package:text_plus/text_plus_type_entity.dart';
import 'package:text_plus/utils/format_text.dart';

class TextPlus extends StatelessWidget {
  final String text;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Color? selectionColor;
  final StrutStyle? strutStyle;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextScaler? textScaler;

  const TextPlus(
    this.text, {
    super.key,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textAlign,
    this.textDirection,
    this.selectionColor,
    this.strutStyle,
    this.textHeightBehavior,
    this.style,
    this.textScaler,
  });

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
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _buildText(text)),
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textAlign: textAlign,
      textDirection: textDirection,
      selectionColor: selectionColor,
      strutStyle: strutStyle,
      textHeightBehavior: textHeightBehavior,
      style: style,
      textScaler: textScaler,
    );
  }
}
