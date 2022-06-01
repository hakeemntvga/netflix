import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import '../../../core/colors/constant.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 200.0,
              width: 40.0,
            ),
            Container(
              width: 130.0,
              height: 200.0,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: kRadius20,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w220_and_h330_face/fDAEJr4WLZLJQmckA2JZNICt0u3.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13.0,
          bottom: -30.0,
          child: BorderedText(
            strokeColor: Kwhitecolor,
            strokeWidth: 10.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: Kblackcolor,
                fontWeight: FontWeight.bold,
                fontSize: 150.0,
                decoration: TextDecoration.none,
                decorationColor: Colors.amber,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
