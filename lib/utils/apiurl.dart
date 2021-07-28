
class ApiUrl{
// for testing only
	static final String TEST_APP = "http://api.bangunmotor.com/app";

// user and profiles
	static final String  USER_LOGIN = "http://192.168.42.249:6060/api/user";
	static final String  USER_REGISTER = "http://192.168.42.249:6060/api/user/register";
	static final String  USER_FORGET = "http://192.168.42.249:6060/api/user/forget";
	static final String  USER_PROFILE_GET = "http://192.168.42.249:6060/api/profile/me";
	static final String  USER_PROFILE_UPDATE = "http://192.168.42.249:6060/api/profile/update";
	static final String  USER_RESET = "http://192.168.42.249:6060/api/user/reset";

// etalase screen
	static final String  BANNER_LIST = "http://192.168.42.249:6060/api/banner/list";
	static final String  PRODUCT_LIST_TOP = "http://192.168.42.249:6060/api/product/list/1";
	static final String  PRODUCT_LIST_RECOMMENDED = "http://192.168.42.249:6060/api/product/list/2";
	static final String  PRODUCT_LIST_LATEST = "http://192.168.42.249:6060/api/product/list/3";

// product screen

// order and cart
	static final String  ORDER_CART_ADD = "http://192.168.42.249:6060/api/cart/add";
	static final String  ORDER_CART_LIST = "http://192.168.42.249:6060/api/cart/list";
	static final String  ORDER_SET_RECIPIENT = "http://192.168.42.249:6060/api/order/prepare";


}