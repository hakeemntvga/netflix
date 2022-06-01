import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constant.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            tittle,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30.0,
          ),
          Kwidth,
          Container(
            width: 30.0,
            height: 30.0,
            color: Colors.blue,
          ),
          Kwidth,
        ],
      ),
    );
  }
}
