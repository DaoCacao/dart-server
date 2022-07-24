import 'package:grpc/src/server/call.dart';

import '../gen/api.pbgrpc.dart';
import 'results.dart';

class PingGrpc extends PingServiceBase {
  @override
  Future<EchoResponse> echo(
    ServiceCall call,
    EchoRequest request,
  ) async {
    return EchoResponse(
      result: Results.ok(),
      message: request.message,
    );
  }
}
