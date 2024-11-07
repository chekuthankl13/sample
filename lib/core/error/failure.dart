abstract class Failure {
  final String error;

  Failure({required this.error});
}

class Failure2 extends Failure {
  Failure2({required super.error});
}
