import 'package:flutter/material.dart';
import '../../core/colors/constant.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 130.0,
      height: 255.0,
      // color: Colors.amber,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg",
          ),
        ),
      ),
    );
  }
}
