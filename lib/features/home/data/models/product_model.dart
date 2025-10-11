import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required double price,
    required String coverPictureUrl,
    @Default(0) int discountPercentage,
    String? description,
    List<String>? images,
    String? categoryId,
    String? brandId,
    @Default(0) int stock,
    @Default(false) bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    required List<ProductModel> items,
    @Default(0) int totalCount,
    @Default(1) int page,
    @Default(10) int pageSize,
    @Default(false) bool hasNextPage,
  }) = _ProductListResponse;

  const ProductListResponse._();

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}