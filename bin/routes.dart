import 'package:shelf_router/shelf_router.dart';

import 'api/auth_handlers.dart';
import 'domain/use_cases/sign_in_use_case.dart';
import 'domain/use_cases/sign_up_use_case.dart';

Router router({
  required SignUpUseCase signUpUseCase,
  required SignInUseCase signInUseCase,
}) =>
    Router()
      ..post("/sign_up", (request) => signUpHandler(request, signUpUseCase))
      ..post("/sign_in", (request) => signInHandler(request, signInUseCase));
