import 'package:core/core.dart';

class QueueFailure extends Failure {
  const QueueFailure(this.key) : super(key);
  final String key;
}
