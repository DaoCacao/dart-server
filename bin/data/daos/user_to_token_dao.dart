import '../entities/user_to_token_entitiy.dart';

class UserToTokenDao {
  final List<UserToTokenEntity> _userToToken;

  UserToTokenDao(this._userToToken);

  Future createUserToToken(int userId, String token) async {
    final userToToken = UserToTokenEntity(userId, token);
    _userToToken.add(userToToken);
  }

  Future<String?> getTokenByUserId(int userId) async {
    try {
      return _userToToken.firstWhere((e) => e.userId == userId).token;
    } on StateError {
      return null;
    }
  }
}
