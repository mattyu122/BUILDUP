import 'package:flutter_application_1/DataModel/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageWidget({
    required this.message,
    required this.isMe,
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
            color: isMe
                ? const Color.fromARGB(255, 104, 46, 170)
                : const Color.fromARGB(
                    255, 10, 0, 1), //Theme.of(context).accentColor,
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
            message,
            style: TextStyle(
                color:
                    isMe ? Color.fromARGB(255, 255, 255, 255) : Colors.white),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ],
      );
}
