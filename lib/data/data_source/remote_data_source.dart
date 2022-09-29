import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/constants.dart';
import 'package:maps/core/api/end_points.dart';
import 'package:maps/data/model/directions_model.dart';
import 'package:maps/data/model/place_details_model.dart';
import 'package:uuid/uuid.dart';

import '../../core/api/api_consumer.dart';
import '../model/auto_complete_search_model.dart';

abstract class RemoteDataSource {
  Future<AutoCompleteSearchModel> getAutoCompleteSearch({String? query});

  Future<PlaceDetailsModel> getPlaceDetails({String? placeId});
  Future<DirectionsModel> getDirections({LatLng? origin,LatLng? destination});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<AutoCompleteSearchModel> getAutoCompleteSearch(
          {String? query}) async =>
      await apiConsumer.get(ApiEndPoints.autoComplete, queryParameters: {
        'input': query,
        'key': googleApiKey,
        'sessiontoken': const Uuid().v4(),
        'types': 'address',
        'components': 'country:eg',
      }).then((value) => AutoCompleteSearchModel.fromJson(value));

  @override
  Future<PlaceDetailsModel> getPlaceDetails({String? placeId}) async =>
      await apiConsumer.get(ApiEndPoints.placeDetails, queryParameters: {
        'place_id': placeId,
        'key': googleApiKey,
        'sessiontoken': const Uuid().v4(),
        'fields': 'geometry',
      }).then((value) => PlaceDetailsModel.fromJson(value));

  @override
  Future<DirectionsModel> getDirections({LatLng? origin, LatLng? destination})async =>
      await apiConsumer.get(ApiEndPoints.directions, queryParameters: {
        'key': googleApiKey,
        'destination': '${destination?.latitude},${destination?.longitude}',
        'origin': '${origin?.latitude},${origin?.longitude}',
      }).then((value) => DirectionsModel.fromJson(value));
}
