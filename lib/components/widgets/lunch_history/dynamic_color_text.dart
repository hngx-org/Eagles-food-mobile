import 'dart:math';
import 'dart:developer' as l;

import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class DynamicColorText extends StatefulWidget {
  const DynamicColorText(
      {Key? key, required this.text, required this.dynamicColor})
      : super(key: key);
  final String text;
  final Color dynamicColor;

  @override
  State<DynamicColorText> createState() => _DynamicColorTextState();
}

class _DynamicColorTextState extends State<DynamicColorText> {
  List coloredIndexes = [];
  List<String> splitedText = [];

  @override
  void initState() {
    final random = Random();
    int numberOfWordsToColor = random.nextInt(2) + 1;
    splitedText = widget.text.split(' ');
    coloredIndexes = getColoredIndexes(splitedText, numberOfWordsToColor);
    l.log(numberOfWordsToColor.toString());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text.rich(TextSpan(
    //     children: List.generate(splitedText.length, (index) {
    //   l.log(index.toString());
    //   return TextSpan(
    //       text: "${splitedText[index]} ",
    //       style: Theme.of(context).textTheme.titleMedium?.copyWith(
    //           fontFamily: "Stapel",
    //           fontSize: 16,
    //           fontWeight: FontWeight.w600,
    //           color: coloredIndexes.contains(index)
    //               ? widget.dynamicColor
    //               : ColorUtils.Black));
    // })));
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: widget.dynamicColor),
    );
  }
}

List<int> getColoredIndexes<T>(List<String> list, int indexLength) {
  if (list.length <= 2) {
    return list.isEmpty ? [] : [0];
  } else {
    final random = Random();
    final startIndex = random.nextInt(list.length - 1);

    if (indexLength == 1) {
      return [startIndex];
    } else {
      return [startIndex, startIndex + 1];
    }
  }
}
