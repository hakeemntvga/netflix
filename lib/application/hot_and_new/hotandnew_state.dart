part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyonesWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotandnewState.initial() =>const HotandnewState(
        comingSoonList: [],
        everyonesWatchingList: [],
        isLoading: false,
        hasError: false,

      );
}
