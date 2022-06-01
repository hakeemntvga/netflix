import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/Screen_home.dart';
import 'package:netflix/presentation/new_hot/screen_new_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';
import 'package:netflix/presentation/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    const ScreenHomePage(),
    const ScreenNewHot(),
    const ScreenFastlaugh(),
     ScreeSearch(),
    ScreenDownlods(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroudColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const ScreenBottomNavigationBar(),
    );
  }
}
