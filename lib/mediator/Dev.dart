import 'package:mediator_exemplo/mediator/MembroTime.dart';

final class Dev extends MembroTime {
  Dev({
    required super.nome,
  });

  @override
  String toString() => '$nome (Dev)';
}