abstract class UseCase {
  Future call();
}

abstract class UseCaseArgs<A> {
  Future call(A args);
}

abstract class UseCaseResult<R> {
  Future<R> call();
}

abstract class UseCaseArgsResult<A, R> {
  Future<R> call(A args);
}
