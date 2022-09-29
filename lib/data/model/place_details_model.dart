class PlaceDetailsModel {
  PlaceDetailsModel({this.result});

  final Result? result;

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlaceDetailsModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result ?? result?.toJson(),
      };
}

class Result {
  Result({this.geometry});

  final Geometry? geometry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry ?? geometry?.toJson(),
      };
}

class Geometry {
  Geometry({this.location});

  final Location? location;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location ?? location?.toJson(),
      };
}

class Location {
  Location({this.lat, this.lng});

  final double? lat;
  final double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] ?? json["lat"].toDouble(),
        lng: json["lng"] ?? json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
