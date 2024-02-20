import 'package:mediator_exemplo/mediator/MembroTime.dart';

final class PO extends MembroTime {
  PO({
    required super.nome,
  });

  @override
  String toString() => '$nome (PO)';
}