import 'dart:ui';

class Constants{
  static final String app_title = "BANGUNMOTOR";
  static final String app_subtitle = "Kuy Kreasikan Motormu Sendiri";

  //colors
  static const Color clr_purple = const Color(0xFF9C27B0);
  static const Color clr_blue = const Color(0xFF548CFF);
  static const Color clr_red = const Color(0xFFF44336);
  static const Color clr_orange = const Color(0xFFFF682D);
  static const Color clr_light_grey = const Color(0xAAD3D3D3);

  static const introDotColor = const Color(0xffe8e8e8);
  static const introDotActiveColor = const Color(0xffff3800);
  static const introTitleColor = const Color(0xff1c1a1a);
  static const introDescriptionColor = const Color(0xff707070);

  static String isOnBoard = "IS_ONBOARD";
  static String isLoggedIn = "IS_LOGGED_IN";
  static String userData = "USERDATA";
  
  //Validations REGEX
  static final String PATTERN_EMAIL = "^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$";
}
