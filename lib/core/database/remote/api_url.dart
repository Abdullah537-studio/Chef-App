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
  static const chefChangePassword = 'chef/change-password';
}

class ApiDelete {
  static const chefDelete = 'chef/delete';
}

class ApiPatche {}
