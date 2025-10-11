import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
abstract class BrandModel with _$BrandModel {
  const factory BrandModel({
    required String id,
    required String name,
    required String coverPictureUrl,
    String? description,
    @Default(0) int productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BrandModel;
  
  const BrandModel._();

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

@freezed
abstract class BrandListResponse with _$BrandListResponse {
  const factory BrandListResponse({
    required List<BrandModel> categories,
    @Default(0) int totalCount,
  }) = _BrandListResponse;

  const BrandListResponse._();

  factory BrandListResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandListResponseFromJson(json);
}

