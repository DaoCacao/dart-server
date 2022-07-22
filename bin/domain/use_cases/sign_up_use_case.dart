import '../../data/database.dart';
import '../../token_manager.dart';
import '../models/user.dart';
import 'base/use_case.dart';

class SignUpUseCase extends UseCaseArgsResult<SignUpArgs, SignUpResult> {
  final Database _database;
  final TokenManager _tokenManager;

  SignUpUseCase(this._database, this._tokenManager);

  @override
  Future<SignUpResult> call(SignUpArgs args) async {
    final oldUser = await _database.userDao.getUserByCredentials(
      args.username,
      args.password,
    );

    if (oldUser != null) {
      throw SignUpErrorUserExist();
    }

    final user = await _database.userDao.createUser(
      args.username,
      args.password,
    );

    final token = _tokenManager.createToken(user);
    await _database.userToTokenDao.createUserToToken(user.id, token);

    return SignUpResult(
      token,
      user,
    );
  }
}

class SignUpArgs {
  final String username;
  final String password;

  SignUpArgs(this.username, this.password);
}

class SignUpResult {
  final String token;
  final User user;

  SignUpResult(this.token, this.user);
}

class SignUpErrorUserExist {}
