import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_state.dart';
import 'package:shopping_app/features/home/presentation/widgets/barnd_box.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_card.dart';
import 'package:shopping_app/features/home/presentation/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load initial data when the page loads
    context.read<HomeCubit>().loadInitialData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.background,
      appBar: MainAppBar(isHome: true),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoaded && state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: ColorManger.errorRed,
              ),
            );
            context.read<HomeCubit>().clearError();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.generalSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyles.h2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManger.black,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Shop your favorite products",
                        style: TextStyles.b3.copyWith(color: ColorManger.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Spacing.generalSpacing),
                
                // Search bar
                CustomSearchBar(
                  hintText: 'Search...',
                  controller: _searchController,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      context.read<HomeCubit>().loadInitialData();
                    } else {
                      context.read<HomeCubit>().searchProducts(value);
                    }
                  },
                ),
                SizedBox(height: Spacing.generalSpacing),

                // Brands Section
                if (state is HomeLoaded && state.brands.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.only(left: Spacing.generalSpacing, bottom: 12.h),
                    child: Text(
                      "Popular Brands",
                      style: TextStyles.h3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorManger.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 58.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: Spacing.generalSpacing),
                      itemCount: state.brands.length,
                      separatorBuilder: (context, idx) => SizedBox(width: 14.w),
                      itemBuilder: (context, index) {
                        final brand = state.brands[index];
                        return BarndBox(
                          logoUrl: brand.coverPictureUrl,
                          brandName: brand.name.toUpperCase(),
                          onTap: () => context.read<HomeCubit>().filterByBrand(brand.id),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Spacing.generalSpacing),
                ],

                // Products Section
                Padding(
                  padding: EdgeInsets.only(left: Spacing.generalSpacing, bottom: 12.h),
                  child: Text(
                    "New Arrival",
                    style: TextStyles.h3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorManger.black,
                    ),
                  ),
                ),

                // Products Grid
                if (state is HomeLoading) ...[
                  const Center(child: CircularProgressIndicator()),
                ] else if (state is HomeError) ...[
                  Center(
                    child: Column(
                      children: [
                        Text(
                          state.message,
                          style: TextStyles.b3.copyWith(color: ColorManger.errorRed),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () => context.read<HomeCubit>().loadInitialData(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ] else if (state is HomeLoaded) ...[
                  GridView.builder(
                    itemCount: state.products.length + (state.isLoadingMore ? 1 : 0),
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: Spacing.generalSpacing),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: Spacing.generalSpacing,
                      crossAxisSpacing: Spacing.generalSpacing,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      if (index == state.products.length) {
                        // Loading indicator for pagination
                        return const Center(child: CircularProgressIndicator());
                      }
                      
                      final product = state.products[index];
                      return ProductCard(
                        imageUrl: product.coverPictureUrl,
                        productName: product.name,
                        price: product.price,
                        isFavorite: product.isFavorite,
                        onTap: () {
                          // Navigate to product details
                        },
                        onFavoriteTap: () {
                          
                        },
                      );
                    },
                  ),
                  
                  // Load more button
                  if (state.hasMoreProducts && !state.isLoadingMore)
                    Padding(
                      padding: EdgeInsets.all(Spacing.generalSpacing),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => context.read<HomeCubit>().loadMoreProducts(),
                          child: const Text('Load More'),
                        ),
                      ),
                    ),

                    SizedBox(height: Spacing.generalSpacing,)
                ],
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Handle navigation
          switch (index) {
            case 0:
              // Already on home
              break;
            case 1:
              // Navigate to wishlist
              break;
            case 2:
              // Navigate to cart
              break;
            case 3:
              // Navigate to wallet
              break;
          }
        },
      ),
    );
  }
}
