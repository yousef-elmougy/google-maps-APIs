import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/core/error/failures.dart';
import 'package:maps/data/data_source/remote_data_source.dart';
import 'package:maps/data/model/directions_model.dart';
import 'package:maps/data/model/place_details_model.dart';

import '../../core/error/exceptions.dart';
import '../model/auto_complete_search_model.dart';

abstract class Repository {
  Future<Either<Failure, AutoCompleteSearchModel>> getAutoCompleteSearch({String ?query});
  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetails({String ?placeId});
  Future<Either<Failure, DirectionsModel>> getDirections({LatLng? origin, LatLng? destination});
}

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AutoCompleteSearchModel>> getAutoCompleteSearch(
      {String ?query}) async {
    try {
      return Right(await remoteDataSource.getAutoCompleteSearch(query:query));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetails({String? placeId})async {
    try {
      return Right(await remoteDataSource.getPlaceDetails(placeId: placeId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DirectionsModel>> getDirections({LatLng? origin, LatLng? destination}) async {
    try {
      return Right(await remoteDataSource.getDirections(origin: origin,destination: destination));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
