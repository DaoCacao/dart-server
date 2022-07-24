import '../gen/api.pb.dart';

abstract class Results {
  static Result ok() => Result(
        status: ResultStatus.OK,
      );

  static Result fieldRequired(String filed) => Result(
        status: ResultStatus.ERROR,
        message: "$filed required",
      );

  static Result error(String message) => Result(
        status: ResultStatus.ERROR,
        message: message,
      );
}
