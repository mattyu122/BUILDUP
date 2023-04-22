import 'package:flutter_application_1/DataModel/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final String senderName;
  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.senderName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          constraints: const BoxConstraints(maxWidth: 170),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: isMe
                ? borderRadius
                    .subtract(const BorderRadius.only(bottomRight: radius))
                : borderRadius
                    .subtract(const BorderRadius.only(bottomLeft: radius)),
          ),
          child: buildMessage(),
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$senderName:",
            style: TextStyle(color: Color.fromARGB(255, 133, 43, 235)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            message,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ],
      );
}
