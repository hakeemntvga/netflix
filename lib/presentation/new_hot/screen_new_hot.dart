import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/new_hot/widgets/coming_soon_widgets.dart';
import 'package:netflix/presentation/new_hot/widgets/everyones_watching_widget.dart';
import '../../core/colors/constant.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            title: const Text(
              "Hot & New",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
            ),
            actions: [
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
            bottom: TabBar(
              unselectedLabelColor: Kwhitecolor,
              labelColor: Kblackcolor,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              labelPadding: const EdgeInsets.all(8.0),
              indicator: BoxDecoration(
                color: Kwhitecolor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Text("🍿 Coming Soon"),
                Text("👀 Everyone's Watching"),
              ],
            ),
          ),
        ),
        body:const TabBarView(
          children: [
             ComingSoonlist(key: Key('coming soon')),
              ComingSoonlist(key: Key('everyones watching list')),
           
          ],
        ),
      ),
    );
  }

  // _buildComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //   );
  // }

  
}

class ComingSoonlist extends StatelessWidget {
  const ComingSoonlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotandnewBloc, HotandnewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("Coming soon list empty"),
          );
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                log(movie.releaseDate.toString());
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  log(formatedDate.toString());
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (e) {
                  month = '';
                  date = '';
                }
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? "No Title",
                  description: movie.overview ?? "No description",
                );
              });
        }
      },
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
    });
    return BlocBuilder<HotandnewBloc, HotandnewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.everyonesWatchingList.isEmpty) {
          return const Center(
            child: Text("Coming soon list empty"),
          );
        } else {
          return ListView.builder(
              itemCount: state.everyonesWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyonesWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                //   log(movie.releaseDate.toString());
                // String month = '';
                // String date = '' ;
                // try {
                //   final _date = DateTime.tryParse(movie.releaseDate!);
                // final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                // log(formatedDate.toString());
                // month =formatedDate.split(' ').first.substring(0,3).toUpperCase();
                // date = movie.releaseDate!.split('-')[1];
                // } catch (e) {
                //   month = '';
                //   date = '';
                // }
                return EveryoneWatchingWidget(
                  id: movie.id.toString(),
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName:  movie.originalTitle ?? "No Title",
                  description: movie.overview ?? "No description",
                );
              });
        }
      },
    );
  }
}
