import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../domain/use_cases/sign_in_use_case.dart';
import '../domain/use_cases/sign_up_use_case.dart';
import 'mapper.dart';
import 'responses/auth_response.dart';

Future<Response> signUpHandler(
  Request request,
  SignUpUseCase signUpUseCase,
) async {
  final body = jsonDecode(await request.readAsString());
  final username = body["username"]?.toString() ?? "";
  final password = body["password"]?.toString() ?? "";

  if (username.isEmpty && password.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Username is required\nPassword is required",
    );
  }
  if (username.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Username is required",
    );
  }
  if (password.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Password is required",
    );
  }

  final args = SignUpArgs(username, password);
  try {
    final result = await signUpUseCase.call(args);
    return Response.ok(
      jsonEncode(
        AuthResponse(
          token: result.token,
          user: mapUser(result.user),
        ).toMap(),
      ),
    );
  } on SignUpErrorUserExist {
    return Response(
      HttpStatus.badRequest,
      body: "User already exist",
    );
  }
}

Future<Response> signInHandler(
  Request request,
  SignInUseCase signInUseCase,
) async {
  final username = request.params["username"].toString();
  final password = request.params["password"].toString();

  if (username.isEmpty || password.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Username is required"
          "Password is required",
    );
  }
  if (username.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Username is required",
    );
  }
  if (password.isEmpty) {
    return Response(
      HttpStatus.badRequest,
      body: "Password is required",
    );
  }

  try {
    final args = SignInArgs(username, password);
    final result = await signInUseCase.call(args);
    return Response.ok(
      jsonEncode(
        AuthResponse(
          token: result.token,
          user: mapUser(result.user),
        ).toMap(),
      ),
    );
  } on SignInErrorNoUserExist {
    return Response(
      HttpStatus.badRequest,
      body: "Wrong username or password",
    );
  }
}
