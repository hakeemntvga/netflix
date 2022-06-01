
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/hot_and_newrespo/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_newrespo/model/hot_and_newrespo.dart';

import '../../domain/core/api_end_points.dart';


@LazySingleton(as:HotAndNewServices)
class HotAndNewImplimentation implements HotAndNewServices{
  @override
  Future<Either<MainFailures, HotAndNewrespo>> getHotAndNewMovieData()async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.hotAndNewMovie,
        
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewrespo.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewrespo>> getHotAndNewTvData()async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.hotAndNewTv,
       
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewrespo.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
  
}