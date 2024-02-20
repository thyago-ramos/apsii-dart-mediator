import 'package:mediator_exemplo/mediator/HubNotificacao.dart';

base class MembroTime {
  MembroTime({
    required this.nome,
  });

  final String nome;

  HubNotificacao? hubNotificacao;
  String? ultimaNotificacao;

  void receber(String remetente, String mensagem) {
    ultimaNotificacao = '$remetente: "$mensagem"';
  }

  void enviar(String mensagem) {
    hubNotificacao?.enviar(this, mensagem);
  }

  void enviarPara<T extends MembroTime>(String mensagem) {
    hubNotificacao?.enviarPara<T>(this, mensagem);
  }
}