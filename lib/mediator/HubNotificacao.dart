import 'package:mediator_exemplo/mediator/MembroTime.dart';

abstract interface class HubNotificacao {
  List<MembroTime> getMembrosTime();
  void registrar(MembroTime membro);
  void enviar(MembroTime remetente, String mensagem);
  void enviarPara<T extends MembroTime>(MembroTime remetente, String mensagem);
}