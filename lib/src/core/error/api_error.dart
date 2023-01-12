import 'package:equatable/equatable.dart';

import 'error_codes.dart';

class ApiError extends Equatable {
  const ApiError({
    this.code = ErrorCodes.failure,
    this.message = '',
  });

  final int? code;
  final String? message;

  @override
  List<Object?> get props => [code, message];

  @override
  bool? get stringify => true;
}
