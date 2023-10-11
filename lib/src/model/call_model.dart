import 'dart:math';
import 'package:video_call_pro/src/const/strings.dart';

class CallModel {
  static int appID = Strings.appID;
  static String appSign = Strings.appSign;

  static Future<String> getUniqueUserId() async {
    final random = Random();
    final userId = random.nextInt(999999).toString().padLeft(6, '0');
    return userId;
  }

  /*void createCall() {
    final invitees = [
      ZegoCallUser("kullanici_id_1", 'Kullanıcı 1'),
      ZegoCallUser("kullanici_id_2", 'Kullanıcı 2'),
    ];
    const isVideoCall = true;
    const customData = 'Özel veri';
    const timeoutSeconds = 60;

    callController
        .sendCallInvitation(
      invitees: invitees,
      isVideoCall: isVideoCall,
      customData: customData,
      timeoutSeconds: timeoutSeconds,
    )
        .then((result) {
      if (result) {
      } else {}
    });
  }*/
}
