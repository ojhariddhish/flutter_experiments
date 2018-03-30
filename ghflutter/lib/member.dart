
class Member {
  final String login;
  final String avatarUrl;

  Member(this.login, this.avatarUrl) {
    if (login == null) {
      throw new ArgumentError("Login of Member cannot be null. "
          "Received: '$login'");
    }
    if (avatarUrl == null) {
      throw new ArgumentError("avatarUrl of Member cannot be null"
          "Received: '$avatarUrl'");
    }
  }
}