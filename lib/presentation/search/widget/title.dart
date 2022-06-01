import 'package:flutter/material.dart';

class SearchTextTittle extends StatelessWidget {
  final String title;
  const SearchTextTittle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
