import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:shopping_app/features/home/data/models/brand_model.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<ProductListResponse>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? categoryId,
    String? brandId,
    String? searchQuery,
  }) async {
    return await _remoteDataSource.getProducts(
      page: page,
      pageSize: pageSize,
      categoryId: categoryId,
      brandId: brandId,
      searchQuery: searchQuery,
    );
  }

  @override
  Future<ApiResult<BrandListResponse>> getBrands() async {
    return await _remoteDataSource.getBrands();
  }

  @override
  Future<ApiResult<ProductModel>> getProductById(String productId) async {
    return await _remoteDataSource.getProductById(productId);
  }

  @override
  Future<ApiResult<void>> toggleFavorite(String productId) async {
    return await _remoteDataSource.toggleFavorite(productId);
  }
}
