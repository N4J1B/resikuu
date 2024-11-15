import 'failure_model.dart';

class CustomException implements Exception {
  final FailureModel failure;

  CustomException(this.failure);

  @override
  String toString() {
    return 'CustomException: ${failure.message} (Status Code: ${failure.statusCode})';
  }

  int? get statusCode => failure.statusCode;
  String? get message => failure.message;
}
