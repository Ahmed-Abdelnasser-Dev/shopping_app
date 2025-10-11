import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/repositories/home_repository.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  Future<void> loadInitialData() async {
    emit(const HomeState.loading());
    final brandsResult = await _homeRepository.getBrands();
    final productsResult = await _homeRepository.getProducts(page: 1, pageSize: 10);

    brandsResult.when(
      success: (brandsResp) {
        productsResult.when(
          success: (productsResp) {
            emit(HomeState.loaded(
              brands: brandsResp.categories,
              products: productsResp.items,
              hasMoreProducts: productsResp.hasNextPage,
              currentPage: productsResp.page,
            ));
          },
          failure: (error) => emit(HomeState.error(error)),
        );
      },
      failure: (error) => emit(HomeState.error(error)),
    );
  }

  Future<void> loadMoreProducts() async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.hasMoreProducts) {
      emit(currentState.copyWith(isLoadingMore: true));

      final result = await _homeRepository.getProducts(
        page: currentState.currentPage + 1,
        pageSize: 10,
      );
      result.when(
        success: (productsResp) {
          final updatedProducts = [
            ...currentState.products,
            ...productsResp.items,
          ];
          emit(currentState.copyWith(
            products: updatedProducts,
            hasMoreProducts: productsResp.hasNextPage,
            currentPage: productsResp.page,
            isLoadingMore: false,
          ));
        },
        failure: (error) {
          emit(currentState.copyWith(
            isLoadingMore: false,
            error: error,
          ));
        },
      );
    }
  }

  Future<void> searchProducts(String query) async {
    emit(const HomeState.loading());
    final result = await _homeRepository.getProducts(
      page: 1,
      pageSize: 10,
      searchQuery: query,
    );
    result.when(
      success: (productsResp) {
        emit(HomeState.loaded(
          brands: const [],
          products: productsResp.items,
          hasMoreProducts: productsResp.hasNextPage,
          currentPage: productsResp.page,
          searchQuery: query,
        ));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  Future<void> filterByBrand(String brandId) async {
    emit(const HomeState.loading());
    final result = await _homeRepository.getProducts(
      page: 1,
      pageSize: 10,
      brandId: brandId,
    );
    result.when(
      success: (productsResp) {
        emit(HomeState.loaded(
          brands: const [],
          products: productsResp.items,
          hasMoreProducts: productsResp.hasNextPage,
          currentPage: productsResp.page,
          selectedBrandId: brandId,
        ));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  Future<void> toggleFavorite(String productId) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final updatedProducts = currentState.products.map((product) {
        if (product.id == productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      }).toList();
      emit(currentState.copyWith(products: updatedProducts));

      final result = await _homeRepository.toggleFavorite(productId);
      result.when(
        success: (_) {}, // Optimistic, no change
        failure: (error) {
          // Revert the optimistic update on failure
          final revertedProducts = currentState.products.map((product) {
            if (product.id == productId) {
              return product.copyWith(isFavorite: !product.isFavorite);
            }
            return product;
          }).toList();

          emit(currentState.copyWith(
            products: revertedProducts,
            error: error,
          ));
        },
      );
    }
  }

  void clearError() {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(error: null));
    }
  }
}
