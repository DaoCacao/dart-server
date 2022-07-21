import 'dart:convert';
import "dart:io";

import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart";
import "package:shelf_router/shelf_router.dart";

final tokens = {};

// Configure routes.
final _router = Router()
  ..post("/sign_up", _signUpHandler)
  ..post("/sign_in", _signInHandler)
  ..get("/", _rootHandler);

Response _rootHandler(Request request) {
  return Response.ok("Hello, World!");
}

Future<Response> _signUpHandler(Request request) async {
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

  final token = "$username:$password";

  tokens[username] = token;

  return Response.ok(
    jsonEncode({
      "token": token,
    }),
  );
}

Response _signInHandler(Request request) {
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
    {},
  );
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline()
      .addMiddleware(fixCORS())
      .addMiddleware(logRequests())
      .addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment["PORT"] ?? "8080");
  final server = await serve(_handler, ip, port);
  print("Server listening on http://${server.address.host}:${server.port}");
}

Middleware fixCORS() {
  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': '*',
  };
  return createMiddleware(
    requestHandler: (Request request) {
      if (request.method == 'OPTIONS') {
        return Response.ok(null, headers: corsHeaders);
      } else {
        return null;
      }
    },
    responseHandler: (Response response) {
      return response.change(headers: corsHeaders);
    },
  );
}
