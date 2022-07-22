import 'package:shelf_router/shelf_router.dart';

import 'auth_handlers.dart';

Router router(Map<String, String> tokens) => Router()
  ..post("/sign_up", (request) => signUpHandler(request, tokens))
  ..post("/sign_in", (request) => signInHandler(request, tokens));
