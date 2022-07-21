import 'dart:convert';

import "package:http/http.dart";
import "package:test/test.dart";
import "package:test_process/test_process.dart";

void main() {
  final port = "8080";
  final host = "http://0.0.0.0:$port";

  setUp(() async {
    await TestProcess.start(
      "dart",
      ["run", "bin/server.dart"],
      environment: {"PORT": port},
    );
  });

  test("Root", () async {
    final response = await get(Uri.parse("$host/"));
    expect(response.statusCode, 200);
    expect(response.body, "Hello, World!");
  });

  test("Sign up with valid params returns 200 and token", () async {
    final response = await post(
      Uri.parse("$host/sign_up"),
      body: jsonEncode({
        "username": "username",
        "password": "password",
      }),
    );
    expect(response.statusCode, 200);
    expect(response.body, contains("token"));
  });

  test("Sign up without username and password returns 400", () async {
    final response = await post(
      Uri.parse("$host/sign_up"),
      body: jsonEncode({}),
    );
    expect(response.statusCode, 400, reason: response.body);
    expect(response.body, "Username is required\nPassword is required");
  });

  test("Sign up without username returns 400", () async {
    final response = await post(
      Uri.parse("$host/sign_up"),
      body: jsonEncode({
        "password": "password",
      }),
    );
    expect(response.statusCode, 400);
    expect(response.body, "Username is required");
  });

  test("Sign up without password returns 400", () async {
    final response = await post(
      Uri.parse("$host/sign_up"),
      body: jsonEncode({
        "username": "username",
      }),
    );
    expect(response.statusCode, 400);
    expect(response.body, "Password is required");
  });
}
