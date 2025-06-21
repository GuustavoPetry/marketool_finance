class AuthService {
  static bool isLoggedIn = false;
  static String? username = "";

  static void login(String user) {
    username = user;
    isLoggedIn = true;
  }

  static void logout() {
    isLoggedIn = false;
  }
}
