import 'package:grpc/src/server/call.dart';

import '../domain/use_cases/sign_in_use_case.dart';
import '../domain/use_cases/sign_up_use_case.dart';
import '../gen/api.pbgrpc.dart';
import 'mapper.dart';
import 'results.dart';

class AuthGrpc extends AuthServiceBase {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthGrpc({
    required this.signUpUseCase,
    required this.signInUseCase,
  });

  @override
  Future<SignUpResponse> signUp(
    ServiceCall call,
    SignUpRequest request,
  ) async {
    if (request.username.isEmpty) {
      return SignUpResponse(
        result: Results.fieldRequired("username"),
      );
    }
    if (request.passworrd.isEmpty) {
      return SignUpResponse(
        result: Results.fieldRequired("password"),
      );
    }
    try {
      final result = await signUpUseCase.call(
        SignUpArgs(
          request.username,
          request.passworrd,
        ),
      );
      return SignUpResponse(
        result: Results.ok(),
        token: result.token,
        user: mapUser(result.user),
      );
    } on SignUpErrorUserExist {
      return SignUpResponse(
        result: Results.error("User already exist"),
      );
    }
  }

  @override
  Future<SignInResponse> signIn(
    ServiceCall call,
    SignInRequest request,
  ) async {
    if (request.username.isEmpty) {
      return SignInResponse(
        result: Results.fieldRequired("username"),
      );
    }
    if (request.password.isEmpty) {
      return SignInResponse(
        result: Results.fieldRequired("password"),
      );
    }
    try {
      final result = await signInUseCase.call(
        SignInArgs(
          request.username,
          request.password,
        ),
      );
      return SignInResponse(
        result: Results.ok(),
        token: result.token,
        user: mapUser(result.user),
      );
    } on SignInErrorNoUserExist {
      return SignInResponse(
        result: Results.error("Wrong username or password"),
      );
    }
  }
}
