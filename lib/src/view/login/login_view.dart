import 'package:flutter/material.dart';
import 'package:video_call_pro/src/model/call_model.dart';
import 'package:video_call_pro/src/model/user_model.dart';
import 'package:video_call_pro/src/view/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final TextEditingController userIdTextController =
      TextEditingController(text: 'user_id');

  @override
  void initState() {
    super.initState();
    setup();
  }

  void setup() async {
    CallModel.getUniqueUserId().then((userId) async {
      setState(() {
        userIdTextController.text = userId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 220,
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: userIdTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Phone Number',
                    ),
                    onChanged: (value) => () {},
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                      ),
                      onChanged: (value) => () {}),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () => signIn(),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    currentUser.id = userIdTextController.text;
    currentUser.name = 'user_${userIdTextController.text}';
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }
}
