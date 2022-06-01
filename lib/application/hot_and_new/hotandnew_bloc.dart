import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_newrespo/hot_and_new_service.dart';

import '../../domain/hot_and_newrespo/model/hot_and_newrespo.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewServices _hotAndNewServices;
  HotandnewBloc(this._hotAndNewServices) : super(HotandnewState.initial()) {
    /*
    get hot and new movie data
     */
    on<LoadDataInComingSoon>(
      (event, emit) async {
        // send loading to ui
        emit(
          const HotandnewState(
              comingSoonList: [],
              everyonesWatchingList: [],
              isLoading: true,
              hasError: false),
        );
        //get data from remote
        final _result = await _hotAndNewServices.getHotAndNewMovieData();
        // data to state
        final newState = _result.fold(
          (MainFailures failures) {
            return const HotandnewState(
              comingSoonList: [],
              everyonesWatchingList: [],
              isLoading: false,
              hasError: true,
            );
          },
          (HotAndNewrespo resp) {
            return HotandnewState(
              comingSoonList: resp.results,
              everyonesWatchingList: state.everyonesWatchingList,
              isLoading: false,
              hasError: false,
            );
          },
        );

        emit(newState);
      },
    );

    /*
    get hot and new tv data
     */

    on<LoadDataInEveryOnesWatching>(
      (event, emit) async {
        // send loading to ui
        emit(
          const HotandnewState(
              comingSoonList: [],
              everyonesWatchingList: [],
              isLoading: true,
              hasError: false),
        );
        //get data from remote
        final _result = await _hotAndNewServices.getHotAndNewTvData();
        // data to state
        final newState = _result.fold(
          (MainFailures failures) {
            return const HotandnewState(
              comingSoonList: [],
              everyonesWatchingList: [],
              isLoading: false,
              hasError: true,
            );
          },
          (HotAndNewrespo resp) {
            return HotandnewState(
              comingSoonList: resp.results,
              everyonesWatchingList: state.comingSoonList,
              isLoading: false,
              hasError: false,
            );
          },
        );

        emit(newState);
      },
    );
  }
}
