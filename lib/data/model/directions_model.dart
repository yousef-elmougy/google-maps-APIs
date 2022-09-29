class DirectionsModel {
  DirectionsModel({this.routes});

  final List<Route>? routes;

  factory DirectionsModel.fromJson(Map<String, dynamic> json) =>
      DirectionsModel(
        routes: json["routes"] == null
            ? null
            : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? null
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
      };
}

class Route {
  Route({
    this.bounds,
    this.legs,
    this.overviewPolyline,
  });

  final Bounds? bounds;
  final List<Leg>? legs;
  final Polyline? overviewPolyline;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        bounds: json["bounds"] == null ? null : Bounds.fromJson(json["bounds"]),
        legs: json["legs"] == null
            ? null
            : List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        overviewPolyline: json["overview_polyline"] == null
            ? null
            : Polyline.fromJson(json["overview_polyline"]),
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds ?? bounds?.toJson(),
        "legs": legs == null
            ? null
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "overview_polyline": overviewPolyline ?? overviewPolyline?.toJson(),
      };
}

class Bounds {
  Bounds({this.northeast, this.southwest});

  final Northeast? northeast;
  final Northeast? southwest;

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: json["northeast"] == null
            ? null
            : Northeast.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Northeast.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast ?? northeast?.toJson(),
        "southwest": southwest ?? southwest?.toJson(),
      };
}

class Northeast {
  Northeast({this.lat, this.lng});

  final double? lat;
  final double? lng;

  factory Northeast.fromJson(Map<String, dynamic> json) => Northeast(
        lat: json["lat"] ?? json["lat"].toDouble(),
        lng: json["lng"] ?? json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng};
}

class Leg {
  Leg({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
    this.trafficSpeedEntry,
    this.viaWaypoint,
  });

  final Distance? distance;
  final Distance? duration;
  final String? endAddress;
  final Northeast? endLocation;
  final String? startAddress;
  final Northeast? startLocation;
  final List<Step>? steps;
  final List<dynamic>? trafficSpeedEntry;
  final List<dynamic>? viaWaypoint;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        distance: json["distance"] == null
            ? null
            : Distance.fromJson(json["distance"]),
        duration: json["duration"] == null
            ? null
            : Distance.fromJson(json["duration"]),
        endAddress: json["end_address"],
        endLocation: json["end_location"] == null
            ? null
            : Northeast.fromJson(json["end_location"]),
        startAddress: json["start_address"],
        startLocation: json["start_location"] == null
            ? null
            : Northeast.fromJson(json["start_location"]),
        steps: json["steps"] == null
            ? null
            : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        trafficSpeedEntry: json["traffic_speed_entry"] == null
            ? null
            : List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: json["via_waypoint"] == null
            ? null
            : List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance ?? distance?.toJson(),
        "duration": duration ?? duration?.toJson(),
        "end_address": endAddress,
        "end_location": endLocation ?? endLocation?.toJson(),
        "start_address": startAddress,
        "start_location": startLocation ?? startLocation?.toJson(),
        "steps": steps == null
            ? null
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "traffic_speed_entry": trafficSpeedEntry == null
            ? null
            : List<dynamic>.from(trafficSpeedEntry!.map((x) => x)),
        "via_waypoint": viaWaypoint == null
            ? null
            : List<dynamic>.from(viaWaypoint!.map((x) => x)),
      };
}

class Distance {
  Distance({this.text, this.value});

  final String? text;
  final int? value;

  factory Distance.fromJson(Map<String, dynamic> json) =>
      Distance(text: json["text"], value: json["value"]);

  Map<String, dynamic> toJson() => {"text": text, "value": value};
}

class Step {
  Step({
    this.distance,
    this.duration,
    this.endLocation,
    this.polyline,
    this.startLocation,
    this.travelMode,
    this.maneuver,
  });

  final Distance? distance;
  final Distance? duration;
  final Northeast? endLocation;
  final Polyline? polyline;
  final Northeast? startLocation;
  final TravelMode? travelMode;
  final String? maneuver;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: json["distance"] == null
            ? null
            : Distance.fromJson(json["distance"]),
        duration: json["duration"] == null
            ? null
            : Distance.fromJson(json["duration"]),
        endLocation: json["end_location"] == null
            ? null
            : Northeast.fromJson(json["end_location"]),
        polyline: json["polyline"] == null
            ? null
            : Polyline.fromJson(json["polyline"]),
        startLocation: json["start_location"] == null
            ? null
            : Northeast.fromJson(json["start_location"]),
        travelMode: json["travel_mode"] == null
            ? null
            : travelModeValues.map![json["travel_mode"]],
        maneuver: json["maneuver"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance ?? distance?.toJson(),
        "duration": duration ?? duration?.toJson(),
        "end_location": endLocation ?? endLocation?.toJson(),
        "polyline": polyline ?? polyline?.toJson(),
        "start_location": startLocation ?? startLocation?.toJson(),
        "travel_mode":
            travelMode == null ? null : travelModeValues.reverse![travelMode],
        "maneuver": maneuver,
      };
}

class Polyline {
  Polyline({
    this.points,
  });

  final String? points;

  factory Polyline.fromJson(Map<String, dynamic> json) => Polyline(
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}

enum TravelMode { DRIVING }

final travelModeValues = EnumValues({"DRIVING": TravelMode.DRIVING});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
