import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_app/features/home/data/models/brand_model.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  
  const factory HomeState.loading() = HomeLoading;
  
  const factory HomeState.loaded({
    required List<BrandModel> brands,
    required List<ProductModel> products,
    @Default(false) bool hasMoreProducts,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    String? searchQuery,
    String? selectedBrandId,
    String? error,
  }) = HomeLoaded;
  
  const factory HomeState.error(String message) = HomeError;
}
