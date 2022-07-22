class UserResponse {
  final int id;
  final String username;

  UserResponse({
    required this.id,
    required this.username,
  });

  Map toMap() => {
        "id": id,
        "username": username,
      };
}
