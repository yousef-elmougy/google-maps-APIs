part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

// POSITION
class PositionLoading extends MapState {}
class PositionLoaded extends MapState {}

// AUTO COMPLETE SEARCH

class AutoCompleteSearchError extends MapState {
  final String error;

  AutoCompleteSearchError(this.error);
}
class AutoCompleteSearchLoaded extends MapState {}

// PLACE DETAILS

class PlaceDetailsError extends MapState {
  final String error;

  PlaceDetailsError(this.error);
}
class PlaceDetailsLoaded extends MapState {}

// DIRECTIONS

class DirectionsError extends MapState {
  final String error;

  DirectionsError(this.error);
}
class DirectionsLoaded extends MapState {}

// ADD MARKER

class AddMarker extends MapState {}


class DistanceAndTimeVisibility extends MapState {}
