import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_repo/search_repo.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchRepo>> searchMovies({
    required String movieQuery,
  });
}
