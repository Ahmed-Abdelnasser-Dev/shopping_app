import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/models/brand_model.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

abstract class HomeRepository {
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
