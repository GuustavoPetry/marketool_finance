class AuthService {
  static bool isLoggedIn = false;
  static String username = "";
  static int? userId;

  static void login(String user, int id) {
    userId = id;
    username = user;
    isLoggedIn = true;
  }

  static void logout() {
    isLoggedIn = false;
  }
}
