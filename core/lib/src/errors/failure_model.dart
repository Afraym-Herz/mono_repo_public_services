import 'package:equatable/equatable.dart';

/// Represents a failure with a descriptive message.
class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class DataNotFoundFailure extends Failure {
  const DataNotFoundFailure(super.message);
}

/// Server rejected the request with multiple field/entity-level errors
/// (e.g. a bulk action's `{ "errors": [...] }` body).
///
/// [message] is a newline-joined summary for callers that only show one
/// string; [messages] preserves each individual error for callers that need
/// to list them all.
class ValidationFailure extends Failure {
  ValidationFailure(this.messages) : super(messages.join('\n'));

  final List<String> messages;

  @override
  List<Object> get props => [message, messages];
}
