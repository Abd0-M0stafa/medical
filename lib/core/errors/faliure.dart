abstract class Failure {
  final String errMessage;

  final bool repeat;

  Failure({required this.errMessage, this.repeat = false});
}
