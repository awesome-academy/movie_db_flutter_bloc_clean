part of 'setting_bloc.dart';

enum {{name.pascalCase()}}Status { initial, loading, success, failure }

@immutable
class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State({
    this.status = {{name.pascalCase()}}Status.initial,
    this.apiError,
  });

  final {{name.pascalCase()}}Status status;
  final ApiError? apiError;

  @override
  List<Object?> get props => [
        status,
        apiError,
      ];

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? status,
    ApiError? apiError,
  }) {
    return {{name.pascalCase()}}State(
      status: status ?? this.status,
      apiError: apiError ?? this.apiError,
    );
  }
}