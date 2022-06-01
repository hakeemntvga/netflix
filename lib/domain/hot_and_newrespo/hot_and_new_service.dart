

import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_newrespo/model/hot_and_newrespo.dart';

abstract class HotAndNewServices{
  Future<Either<MainFailures,HotAndNewrespo>>getHotAndNewMovieData();
  Future<Either<MainFailures,HotAndNewrespo>>getHotAndNewTvData();
}