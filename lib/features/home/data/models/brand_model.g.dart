// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
  id: json['id'] as String,
  name: json['name'] as String,
  coverPictureUrl: json['coverPictureUrl'] as String,
  description: json['description'] as String?,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverPictureUrl': instance.coverPictureUrl,
      'description': instance.description,
      'productCount': instance.productCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_BrandListResponse _$BrandListResponseFromJson(Map<String, dynamic> json) =>
    _BrandListResponse(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BrandListResponseToJson(_BrandListResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'totalCount': instance.totalCount,
    };
