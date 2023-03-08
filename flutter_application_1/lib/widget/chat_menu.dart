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
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
            ],
          ),
          height: 65,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatPage(user: realuser[index]),
              ));
            },
            title: Text(
              realuser[index].userName,
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.white,
            ),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
