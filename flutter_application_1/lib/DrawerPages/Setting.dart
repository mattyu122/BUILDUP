// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  bool HidePassword = true;
  @override
  Widget build(BuildContext context) {
    final urlImage = "https://cdn-icons-png.flaticon.com/512/6133/6133890.png";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 20, 244),
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255), size: 30),
        centerTitle: true,
        title: Text("PASSWORD SETTING",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            )),
        toolbarHeight: 56,
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(children: [
                // Text(
                //   'A C C O U N T',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 53.0,
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // Text(
                //   'Change your password',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 35.0,
                //   ),
                // ),
                // SizedBox(height: 23.0),
                // Text(
                //   '',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.normal,
                //     fontSize: 19.0,
                //   ),
                // ),

                Column(
                  children: [
                    Image.network(
                      urlImage,
                      height: 300,
                      width: 300,
                    )
                  ],
                ),

                SizedBox(height: 25.0),

                //Email TextField,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Old Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 181, 156, 255),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  HidePassword = !HidePassword;
                                });
                              },
                              child: Icon(HidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Enter your old password",
                            hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          obscureText: HidePassword,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'New Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 181, 156, 255),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  HidePassword = !HidePassword;
                                });
                              },
                              child: Icon(HidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Enter your new password",
                            hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          obscureText: HidePassword,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Password comfirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 181, 156, 255),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  HidePassword = !HidePassword;
                                });
                              },
                              child: Icon(HidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Re-enter your new password",
                            hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          obscureText: HidePassword,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(360, 50),
                          backgroundColor: Color.fromARGB(255, 181, 156, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Text(
                        'CHANGE PASSWORD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
