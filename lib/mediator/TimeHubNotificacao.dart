import 'package:mediator_exemplo/mediator/HubNotificacao.dart';
import 'package:mediator_exemplo/mediator/MembroTime.dart';

class TimeHubNotificacao implements HubNotificacao {
  TimeHubNotificacao({
    List<MembroTime>? membros,
  }) {
    membros?.forEach(registrar);
  }

  final _membrosTime = <MembroTime>[];

  @override
  List<MembroTime> getMembrosTime() => _membrosTime;

  @override
  void registrar(MembroTime membro) {
    membro.hubNotificacao = this;

    _membrosTime.add(membro);
  }

  @override
  void enviar(MembroTime remetente, String mensagem) {
    final membrosFiltrados = _membrosTime.where((m) => m != remetente);

    for (final membro in membrosFiltrados) {
      membro.receber(remetente.toString(), mensagem);
    }
  }

  @override
  void enviarPara<T extends MembroTime>(MembroTime remetente, String mensagem) {
    final membrosFiltrados =
    _membrosTime.where((m) => m != remetente).whereType<T>();

    for (final membro in membrosFiltrados) {
      membro.receber(remetente.toString(), mensagem);
    }
  }
}