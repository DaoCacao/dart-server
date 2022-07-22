import "dart:io";

import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart";

import 'corsMiddleware.dart';
import 'routes.dart';

final Map<String, String> tokens = {};

void main(List<String> args) async {
  final host = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment["PORT"] ?? "8080");

  final _handler = Pipeline()
      .addMiddleware(corsMiddleware())
      .addMiddleware(logRequests())
      .addHandler(router(tokens));

  final server = await serve(_handler, host, port);

  print("Server listening on http://${server.address.host}:${server.port}");
}
