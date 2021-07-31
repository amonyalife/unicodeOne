// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    json['count'] as int,
    (json['restaurants'] as List<dynamic>?)
        ?.map((e) => InfoListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['coords'] == null
        ? null
        : Coords.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'count': instance.count,
      'restaurants': instance.restaurants,
      'coords': instance.coords,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) {
  return Coords(
    json['id'] as int,
    (json['longitude'] as num).toDouble(),
    (json['latitude'] as num).toDouble(),
    json['addressName'] as String,
  );
}

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'addressName': instance.addressName,
    };

InfoListModel _$InfoListModelFromJson(Map<String, dynamic> json) {
  return InfoListModel(
    json['id'] as int?,
    json['title'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$InfoListModelToJson(InfoListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
