import 'package:mediator_exemplo/mediator/PO.dart';
import 'package:mediator_exemplo/mediator/Dev.dart';
import 'package:mediator_exemplo/mediator/TimeHubNotificacao.dart';
import 'package:mediator_exemplo/mediator/MembroTime.dart';
import 'package:mediator_exemplo/botao_membro.dart';
import 'package:mediator_exemplo/a/layout_constants.dart';
import 'package:mediator_exemplo/a/platform.dart';
import 'package:flutter/material.dart';

class MediatorExample extends StatefulWidget {
  const MediatorExample();

  @override
  _MediatorExampleState createState() => _MediatorExampleState();
}

class _MediatorExampleState extends State<MediatorExample> {
  late final TimeHubNotificacao _notificationHub;
  final _admin = PO(nome: 'Thiago');

  @override
  void initState() {
    super.initState();

    final members = [
      _admin,
      Dev(nome: 'Thyago'),
      Dev(nome: 'Uélbert'),
      Dev(nome: 'Eduardo'),
    ];
    _notificationHub = TimeHubNotificacao(membros: members);
  }

  void _sendToAll() => setState(() => _admin.enviar('Vamô trabalhar!!!'));

  void _sendToDevelopers() => setState(
        () => _admin.enviarPara<Dev>('Fala, meus devs'),
      );

  void _sendFromMember(MembroTime member) => setState(
        () => member.enviar('Um oi do ${member.nome}'),
      );

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PlatformButton(
              text: "PO: Mandar todos trabalharem",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _sendToAll,
            ),
            PlatformButton(
              text: "PO: Fala, meus devs",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _sendToDevelopers,
            ),
            const Divider(),
            const SizedBox(height: LayoutConstants.spaceL),
            NotificationList(
              members: _notificationHub.getMembrosTime(),
              onTap: _sendFromMember,
            ),
          ],
        ),
      ),
    );
  }
}
