import 'package:flutter/material.dart';
import 'package:mediator_exemplo/a/constants.dart';
import 'package:mediator_exemplo/mediator/MembroTime.dart';

class NotificationList extends StatelessWidget {
  final List<MembroTime> members;
  final ValueSetter<MembroTime> onTap;

  const NotificationList({
    required this.members,
    required this.onTap,
  });

  static const double spaceS = 4.0;
  static const double spaceM = 8.0;

  static const double marginS = 4.0;

  static const double paddingM = 8.0;
  static const double paddingL = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: spaceM),
        const SizedBox(height: spaceS),
        for (final member in members)
          Card(
            margin: const EdgeInsets.symmetric(vertical: marginS),
            child: InkWell(
              onTap: () => onTap(member),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingM,
                  horizontal: paddingL,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: spaceS),
                          Text(member.ultimaNotificacao ?? '-'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: paddingL),
                      child: Icon(Icons.message),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}