class AutoCompleteSearchModel {
  AutoCompleteSearchModel({this.predictions});

  final List<Prediction>? predictions;

  factory AutoCompleteSearchModel.fromJson(Map<String, dynamic> json) =>
      AutoCompleteSearchModel(
        predictions: json["predictions"] == null
            ? null
            : List<Prediction>.from(
                json["predictions"].map((x) => Prediction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "predictions": predictions == null
            ? null
            : List<dynamic>.from(predictions!.map((x) => x.toJson())),
      };
}

class Prediction {
  Prediction({this.description, this.placeId});

  final String? description;
  final String? placeId;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        description: json["description"],
        placeId: json["place_id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "place_id": placeId,
      };
}
