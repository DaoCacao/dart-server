import "dart:io";

import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart";

import 'cors_middleware.dart';
import 'data/daos/user_dao.dart';
import 'data/daos/user_to_token_dao.dart';
import 'data/database.dart';
import 'domain/use_cases/sign_in_use_case.dart';
import 'domain/use_cases/sign_up_use_case.dart';
import 'routes.dart';
import 'token_manager.dart';

void main(List<String> args) async {
  final env = Platform.environment;

  final host = InternetAddress.anyIPv4;
  final port = int.parse(env["PORT"] ?? "8080");
  final jwtSecretKey = env["JWT_SECRET_KEY"] ?? "jwt_secret_key";

  final database = Database(
    userDao: UserDao([]),
    userToTokenDao: UserToTokenDao([]),
  );
  final tokenManager = TokenManager(
    secretKey: jwtSecretKey,
  );
  final signUpUseCase = SignUpUseCase(database, tokenManager);
  final signInUseCase = SignInUseCase(database, tokenManager);

  final _handler = Pipeline()
      .addMiddleware(corsMiddleware())
      .addMiddleware(logRequests())
      .addHandler(router(
        signUpUseCase: signUpUseCase,
        signInUseCase: signInUseCase,
      ));

  final server = await serve(_handler, host, port);

  print("Server listening on http://${server.address.host}:${server.port}");
}
