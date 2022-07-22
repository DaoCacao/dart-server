import 'user_response.dart';

class AuthResponse {
  final String token;
  final UserResponse user;

  AuthResponse({
    required this.token,
    required this.user,
  });

  Map toMap() => {
        "token": token,
        "user": user.toMap(),
      };
}
