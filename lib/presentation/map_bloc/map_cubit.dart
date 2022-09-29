import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/constants.dart';
import 'package:maps/data/model/auto_complete_search_model.dart';
import 'package:maps/data/repository/repository.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:meta/meta.dart';
import '../../core/error/failures.dart';
import '../../core/helper/location_helper.dart';
import '../../data/model/directions_model.dart';
import '../../data/model/place_details_model.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.repository}) : super(MapInitial());

  GoogleMapController? mapController;
  final FloatingSearchBarController floatingSearchController =
      FloatingSearchBarController();
  Set<Marker> markers = {};

  final Repository repository;

  /// ******************************* SEARCH & POSITION *******************************************

  // DETERMINE POSITION

  Position? position;

  Future<void> determinePosition() async {
    emit(PositionLoading());
    position = await LocationHelper().determinePosition();
    emit(PositionLoaded());
  }

  // GET INITIAL CAMERA POSITION

  CameraPosition get initialCameraPosition => CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );

  // GET MY CAMERA LOCATION

  Future<void> getMyCurrentLocation() async => mapController
      ?.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));

  // GET AUTO COMPLETE SEARCH

  AutoCompleteSearchModel? autoCompleteSearchModel;

  Future<void> getAutoCompleteSearch({String? query}) async => await repository
      .getAutoCompleteSearch(query: query)
      .then((value) => value.fold(
              (failure) =>
                  emit(AutoCompleteSearchError(mapFailureToMsg(failure))),
              (value) {
            autoCompleteSearchModel = value;
            emit(AutoCompleteSearchLoaded());
          }));

  /// ******************************* PLACE DETAILS *******************************************

  // GET PLACE DETAILS

  PlaceDetailsModel? placeDetailsModel;

  Future<void> getPlaceDetails({String? placeId, String? title}) async =>
      await repository.getPlaceDetails(placeId: placeId).then((value) =>
          value.fold(
              (failure) => emit(PlaceDetailsError(mapFailureToMsg(failure))),
              (value) {
            placeDetailsModel = value;
            getPlaceDetailsLocation(title: title);
            floatingSearchController.close();
            emit(PlaceDetailsLoaded());
          }));

  // GET PLACE DETAILS CAMERA POSITION

  CameraPosition get placeDetailsCameraPosition => CameraPosition(
        target: LatLng(placeDetailsModel!.result!.geometry!.location!.lat!,
            placeDetailsModel!.result!.geometry!.location!.lng!),
        zoom: 13,
      );

  // PLACE DETAILS LOCATION

  Future<void> getPlaceDetailsLocation({String? title}) async {
    await mapController?.animateCamera(
        CameraUpdate.newCameraPosition(placeDetailsCameraPosition));
    sourceMarker();
    placeMarker(title: title);
  }

  /// ******************************* MARKERS *******************************************

  // SOURCE MARKER

  void sourceMarker() {
    Marker source = Marker(
      markerId: const MarkerId('source'),
      position: initialCameraPosition.target,
      infoWindow: const InfoWindow(title: "Your current Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarker(source);
  }

  // PLACE MARKER

  void placeMarker({String? title}) {
    Marker place = Marker(
      markerId: const MarkerId('place'),
      position: placeDetailsCameraPosition.target,
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarker(place);
  }

  // ADD MARKER

  void addMarker(Marker marker) {
    markers.add(marker);
    emit(AddMarker());
  }

  /// ********************************* DIRECTIONS ****************************

  // GET DIRECTIONS

  DirectionsModel? directionsModel;

  Future<void> getDirections({LatLng? origin, LatLng? destination}) async =>
      await repository
          .getDirections(origin: origin, destination: destination)
          .then((value) => value.fold(
                  (failure) => emit(DirectionsError(mapFailureToMsg(failure))),
                  (value) {
                directionsModel = value;
                emit(DirectionsLoaded());
              }));
}

String mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailure;

    default:
      return unExpectedError;
  }
}
