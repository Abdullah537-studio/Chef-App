class ApiBaseUrl {
  static const baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
}

class ApiGet {
  static locationNominatimOpenstreetmap(query) {
    return "https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1";
  }

  static String getChefDataEndPoint(id) {
    String chefGet = 'chef/get-chef/$id';
    return chefGet;
  }

  static String getAllMealsData = "meal/get-meals";
  static String getMealChefDataEndPoint(id) {
    String mealChefGet = "chef/get-chef/$id/meals";
    return mealChefGet;
  }
}

class ApiPost {
  static const chefSignUp = 'chef/signup';
  static const chefSignIn = 'chef/signin';
  static const chefSendCode = 'chef/send-code';
  static const chefChangePassword = 'chef/change-password';
  static const chefUpdateProfile = 'chef/update';
  static const addMeal = 'meal/add-to-menu';
}

class ApiDelete {
  static const chefDelete = 'chef/delete';
}

class ApiPatche {
  static const chefChangeForgettonPassword = 'chef/change-forgotten-password';
}

class ApiKey {
  static const String email = "email";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
  static const String code = "code";
  static const String message = "message";
  static const String token = "token";
  static const String id = "id";
}
