class AuthService {
  static bool isLoggedIn = true;
  static String? username = "";

  static void login(String user) {
    username = user;
    isLoggedIn = true;
  }

  static void logout() {
    isLoggedIn = false;
  }
}
