import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Future<Response> signUpHandler(
  Request request,
  Map<String, String> tokens,
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
  if (tokens.containsKey(username)) {
    return Response(
      HttpStatus.badRequest,
      body: "User already exist",
    );
  }

  final token = "$username:$password";

  tokens[username] = token;

  return Response.ok(
    jsonEncode({
      "token": token,
    }),
  );
}

Response signInHandler(
  Request request,
  Map<String, String> tokens,
) {
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

  final token = "$username:$password";

  if (tokens[username] != token) {
    return Response.internalServerError(
      body: "Wrong username or password",
    );
  }

  return Response.ok(
    jsonEncode({
      "token": tokens[username],
    }),
  );
}
