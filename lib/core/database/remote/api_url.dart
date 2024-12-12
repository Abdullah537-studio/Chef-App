class ApiUrl {
  static const baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
}

class ApiGet {
  static String getChefDataEndPoint(id) {
    const String chefGet = 'chef/get-chef/';
    return "$chefGet$id";
  }
}

class ApiPost {
  static const chefSignUp = 'chef/signup';
  static const chefSignIn = 'chef/signin';
  static const chefSendCode = 'chef/send-code';
  static const chefChangePassword = 'chef/change-password';
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
  static const String message = "message";
  static const String token = "token";
}
