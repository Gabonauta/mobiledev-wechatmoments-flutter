class UrlConstants {
  static const host = "http://10.0.2.2:2727";

  static String userProfleUrl(String name) {
    return "${UrlConstants.host}/user/$name";
  }

  static String tweetsUrl(String name) {
    return "${UrlConstants.host}/user/$name/tweets";
  }
}
