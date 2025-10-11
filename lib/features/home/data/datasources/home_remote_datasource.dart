import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/features/home/data/models/brand_model.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<ProductListResponse>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? categoryId,
    String? brandId,
    String? searchQuery,
  });

  Future<ApiResult<BrandListResponse>> getBrands();

  Future<ApiResult<ProductModel>> getProductById(String productId);

  Future<ApiResult<void>> toggleFavorite(String productId);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final UnifiedApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ProductListResponse>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? categoryId,
    String? brandId,
    String? searchQuery,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'pageSize': pageSize,
      };

      if (categoryId != null) queryParams['categoryId'] = categoryId;
      if (brandId != null) queryParams['brandId'] = brandId;
      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['search'] = searchQuery;
      }

      final response = await _apiService.getProducts(queryParams);

      return ApiResult.success(
        ProductListResponse.fromJson(response),
      );
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<BrandListResponse>> getBrands() async {
    try {
      final response = await _apiService.getBrands();
      // The API returns a Map with 'categories' key, not a List directly
      return ApiResult.success(
        BrandListResponse.fromJson(response),
      );
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<ProductModel>> getProductById(String productId) async {
    try {
      final response = await _apiService.getProductById(productId);
      return ApiResult.success(
        ProductModel.fromJson(response),
      );
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> toggleFavorite(String productId) async {
    try {
      await _apiService.toggleFavorite(productId);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
