import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/core/constants/media_constants.dart';
import 'package:shopping_app/core/routes/route_helper_extensions.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showCartButton;
  final bool showTitle;
  final bool isHome;
  final String? title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;
  final VoidCallback? onMenuPressed;

  const MainAppBar({
    super.key,
    this.showBackButton = true,
    this.showCartButton = true,
    this.showTitle = true,
    this.isHome = false,
    this.title,
    this.onBackPressed,
    this.onCartPressed,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(Spacing.appBarHeight),
      child: Container(
        padding: EdgeInsets.only(top: Spacing.appBarTop),
        alignment: Alignment.bottomCenter,
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          leadingWidth: Spacing.appBarLeadingWidth,
          automaticallyImplyLeading: false,

          //* Left side
          leading: showBackButton
              ? Padding(
                  padding: EdgeInsets.only(left: Spacing.generalHorizontalPadding),
                  child: GestureDetector(
                    onTap: isHome
                        ? onMenuPressed
                        : onBackPressed ?? () => context.pop(),
                    child: _buildIconCircle(
                      iconPath: isHome ? Media.menu : Media.back,
                    ),
                  ),
                )
              : null,

          //* Title
          title: showTitle && title != null
              ? Text(
                  title!,
                  style: TextStyles.b1,
                )
              : null,

          //* Right side
          actions: [
            if (showCartButton)
              Padding(
                padding: EdgeInsets.only(right: Spacing.generalHorizontalPadding),
                child: GestureDetector(
                  onTap: onCartPressed,
                  child: _buildIconCircle(iconPath: Media.bag),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCircle({required String iconPath}) {
    return Container(
      width: Spacing.appBarIconSize,
      height: Spacing.appBarIconSize,
      decoration: const BoxDecoration(
        color: ColorManger.white,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(Spacing.appBarIconPadding),
      child: SvgPicture.asset(
        iconPath,
        colorFilter:
            const ColorFilter.mode(ColorManger.black, BlendMode.srcIn),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Spacing.appBarHeight);
}
