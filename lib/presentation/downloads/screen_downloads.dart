import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constant.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownlods extends StatelessWidget {
  ScreenDownlods({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
   const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidgets(
          tittle: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 28.0,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
const  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(const DownloadsEvent.getDownloadsImages());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImages());

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Indtroducing downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Kwhitecolor, fontSize: 23.0, fontWeight: FontWeight.bold),
        ),
        Kheight,
        const Text(
          "We'll download a personalised selection of movies and shows for you,so there's\n always something to watch on your\n device. ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        Kheight,
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context,state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isloading
                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2.0,))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.4,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        DownloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.55),
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(
                            left: 170,
                            top: 50.0,
                          ),
                          angle: 25,
                        ),
                        DownloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.55),
                          imageList:
                              "$imageAppendUrl${state.downloads[1].posterPath}",
                          margin: const EdgeInsets.only(
                            right: 170,
                            top: 50.0,
                          ),
                          angle: -25,
                        ),
                        DownloadsImageWidget(
                          radius: 10.0,
                          size: Size(size.width * 0.44, size.width * 0.6),
                          imageList:
                                "$imageAppendUrl${state.downloads[2].posterPath}",
                          margin: const EdgeInsets.only(
                            bottom: 40,
                            top: 50.0,
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: Kbuttoncolorblue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: Kwhitecolor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Kheight,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Kbuttoncolorwhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: Kblackcolor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Kwidth,
        Icon(
          Icons.settings,
          color: Kwhitecolor,
        ),
        Kwidth,
        Text("Smart Download")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
 const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
    this.angle = 0,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          //margin: margin,
          width: size.width,
          height: size.height,
          // color: Colors.black,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
