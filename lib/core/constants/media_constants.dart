abstract class Media {
  Media();

  //? ------------- Base Paths -------------
  static const baseImage = "assets/images/";
  static const baseIcon = "assets/icons/";

  //? ------------- Images -------------

  static const boardingImage1 = "${baseImage}boarding/boarding-1.png";

  //? ------------- Icons -------------
  static const logo = "${baseIcon}icons/logo.svg";

  // -------- App Bar Icons ------------
  static const menu = "${baseIcon}app_bar/menu.svg";
  static const back = "${baseIcon}app_bar/arrow-left.svg";
  static const bag = "${baseIcon}app_bar/bag.svg";

  // -------- Bottom Navigation Bar Icons ------------
  static const home = "${baseIcon}bottom_nav_bar/home-icon.svg";
  static const wishlist = "${baseIcon}bottom_nav_bar/wishlist-icon.svg";
  static const cart = "${baseIcon}bottom_nav_bar/cart-icon.svg";
  static const wallet = "${baseIcon}bottom_nav_bar/wallet-icon.svg";

  // -------- Home Icons ------------
  static const search = "${baseIcon}home/search.svg";
  static const voice = "${baseIcon}home/voice.svg";
  
}
