import '../../data/database.dart';
import '../../token_manager.dart';
import '../models/user.dart';
import 'base/use_case.dart';

class SignInUseCase extends UseCaseArgsResult<SignInArgs, SignInResult> {
  final Database _database;
  final TokenManager _tokenManager;

  SignInUseCase(this._database, this._tokenManager);

  @override
  Future<SignInResult> call(SignInArgs args) async {
    final user = await _database.userDao.getUserByCredentials(
      args.username,
      args.password,
    );

    if (user == null) {
      throw SignInErrorNoUserExist();
    }

    final token = _tokenManager.createToken(user);
    _database.userToTokenDao.createUserToToken(user.id, token);

    return SignInResult(
      token,
      user,
    );
  }
}

class SignInArgs {
  final String username;
  final String password;

  SignInArgs(this.username, this.password);
}

class SignInResult {
  final String token;
  final User user;

  SignInResult(this.token, this.user);
}

class SignInErrorNoUserExist {}
