import 'package:flutter_application_1/DataModel/contactUser.dart';
import 'package:flutter_application_1/HomePages/Chatpage.dart';
import 'package:flutter/material.dart';

class ChatMenuWidget extends StatelessWidget {
  final List<ContactUser> users;
  const ChatMenuWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ContactUser> realuser = users;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: buildChats(realuser),
      ),
    );
  }

  Widget buildChats(List<ContactUser> realuser) {
    print(realuser);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        print(realuser[index]);
        return Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          height: 65,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatPage(user: realuser[index]),
              ));
            },
            title: Text(realuser[index].userName),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
