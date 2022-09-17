class UrlConstants {
  static const host = "http://localhost:3000";

  static String userProfleUrl(String name) {
    return "${UrlConstants.host}/user/$name";
  }

  static String tweetsUrl(String name) {
    return "${UrlConstants.host}/user/$name/tweets";
  }
}
