import "package:dart_jsonwebtoken/dart_jsonwebtoken.dart";

import 'domain/models/user.dart';

class TokenManager {
  final SecretKey _secretKey;

  TokenManager({
    required String secretKey,
  }) : _secretKey = SecretKey(secretKey);

  String createToken(User user) {
    final jwt = JWT(
      {
        "id": user.id,
        "username": user.username,
      },
      issuer: "https://github.com/jonasroussel/dart_jsonwebtoken",
    );

    return jwt.sign(_secretKey);
  }

  TokenState verifyToken(String token) {
    try {
      final jwt = JWT.verify(token, _secretKey);
      return TokenStateValid();
    } on JWTExpiredError {
      return TokenStateExpired();
    } on JWTError catch (ex) {
      return TokenStateInvalid(ex.message);
    }
  }
}

abstract class TokenState {}

class TokenStateValid extends TokenState {}

class TokenStateExpired extends TokenState {}

class TokenStateInvalid extends TokenState {
  final String message;

  TokenStateInvalid(this.message);
}
