import 'package:flutter/material.dart';
import 'package:video_call_pro/src/model/user_model.dart';
import 'package:video_call_pro/src/view/call/call_view.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  /// Users who use the same callId can in the same call.
  final TextEditingController callIdTextController =
      TextEditingController(text: 'call_id');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Video Call")),
        drawer: const CustomDrawer(),
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/cross-collab.png",
                      height: 220,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('Your Phone Number: ${currentUser.id}'),
                  const SizedBox(height: 30),
                  TextField(
                    controller: callIdTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'join a call by id',
                    ),
                    onChanged: (value) => () {},
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () => onTap(),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Join",
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

  void onTap() {
    if (ZegoUIKitPrebuiltCallMiniOverlayMachine().isMinimizing) {
      /// when the application is minimized (in a minimized state),
      /// disable button clicks to prevent multiple PrebuiltCall components from being created.
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CallView(callId: callIdTextController.text.trim())));
  }
}
