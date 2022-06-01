import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final dummyVidoaUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
];

ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(const FastlaughState(
        videoList: [],
        isLoading: true,
        isError: false,
        
      ));

      //get trending movies

      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return const FastlaughState(
            videoList: [],
            isLoading: false,
            isError: true,
            
          );
        },
        (respo) => FastlaughState(
          videoList: respo,
          isLoading: false,
          isError: false,
          
        ),
      );
      //send to ui
      emit(_state);
    });

    on<LikeVideo>((event, emit) async {
    likedVideosIdNotifier.value.add(event.id);
    likedVideosIdNotifier.notifyListeners();
     
      
    });

    on<UnLikeVideo>((event, emit) async {
     likedVideosIdNotifier.value.remove(event.id);
     likedVideosIdNotifier.notifyListeners();
     
    });
  }
}
