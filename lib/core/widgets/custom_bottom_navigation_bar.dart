import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/constants/media_constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.appBarHeight * 0.67,
      decoration: BoxDecoration(
        color: ColorManger.white,
        boxShadow: [
          BoxShadow(
            color: ColorManger.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Media.home,
            label: 'Home',
            index: 0,
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            icon: Media.wishlist,
            label: 'Wishlist',
            index: 1,
            isSelected: currentIndex == 1,
          ),
          _buildNavItem(
            icon: Media.cart,
            label: 'Cart',
            index: 2,
            isSelected: currentIndex == 2,
          ),
          _buildNavItem(
            icon: Media.wallet,
            label: 'Wallet',
            index: 3,
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: SizedBox(
          height: Spacing.appBarHeight * 0.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Icon with up/down animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: isSelected ? -Spacing.generalSpacing * 0.5 : 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 0.0 : 1.0,
                  child: SvgPicture.asset(
                    icon,
                    width: Spacing.appBarIconSize * 0.53, 
                    height: Spacing.appBarIconSize * 0.53,
                    colorFilter: ColorFilter.mode(
                      isSelected ? ColorManger.primary : ColorManger.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              // Text with animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: isSelected ? 33 : -Spacing.generalSpacing, 
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Text(
                    label,
                    style: TextStyles.b3.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorManger.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}