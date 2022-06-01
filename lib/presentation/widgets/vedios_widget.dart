import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200.0,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: CircleAvatar(
            backgroundColor: Colors.black12.withOpacity(
              0.5,
            ),
            radius: 20.0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: Kwhitecolor,
                size: 30.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
