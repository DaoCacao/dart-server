import 'dart:io';

import 'package:shelf/shelf.dart';

Middleware corsMiddleware() {
  const corsHeaders = {
    HttpHeaders.accessControlAllowOriginHeader: '*',
    HttpHeaders.accessControlAllowHeadersHeader: '*',
    HttpHeaders.accessControlAllowMethodsHeader: 'GET, POST, DELETE, OPTIONS',
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
