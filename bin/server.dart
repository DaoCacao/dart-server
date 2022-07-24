import "dart:io";

import 'package:grpc/grpc.dart' as grpc;

import 'data/daos/user_dao.dart';
import 'data/daos/user_to_token_dao.dart';
import 'data/database.dart';
import 'domain/use_cases/sign_in_use_case.dart';
import 'domain/use_cases/sign_up_use_case.dart';
import 'grpc/auth.dart';
import 'grpc/ping.dart';
import 'token_manager.dart';

void main(List<String> args) async {
  final env = Platform.environment;

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(env["PORT"] ?? "8080");
  final jwtSecretKey = env["JWT_SECRET_KEY"] ?? "jwt_secret_key";

  final database = Database(
    userDao: UserDao([]),
    userToTokenDao: UserToTokenDao([]),
  );
  final tokenManager = TokenManager(secretKey: jwtSecretKey);
  final signUpUseCase = SignUpUseCase(database, tokenManager);
  final signInUseCase = SignInUseCase(database, tokenManager);

  final server = grpc.Server(
    [
      AuthGrpc(
        signUpUseCase: signUpUseCase,
        signInUseCase: signInUseCase,
      ),
      PingGrpc(),
    ],
  );

  await server.serve(address: ip.address, port: port);

  print("Server listening on http://${ip.address}:${server.port}");
}
