import 'package:json_annotation/json_annotation.dart';

part 'news_Model.g.dart';

@JsonSerializable()
class NewsModel {
  final int count;
  final List<InfoListModel>? restaurants;
  final Coords? coords;

  NewsModel(this.count, this.restaurants, this.coords);
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Coords {
  final int id;
  final double longitude;
  final double latitude;
  final String addressName;

  Coords(this.id, this.longitude, this.latitude, this.addressName);

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class InfoListModel {
  final int? id;
  final String title;
  final String description;

  InfoListModel(this.id, this.title, this.description);

  factory InfoListModel.fromJson(Map<String, dynamic> json) =>
      _$InfoListModelFromJson(json);
  Map<String, dynamic> toJson() => _$InfoListModelToJson(this);
}
