import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:video_call_pro/src/const/strings.dart';

class CallModel {
  static int appID = Strings.appID;
  static String appSign = Strings.appSign;

  static Future<String> getUniqueUserId() async {
    String? deviceId;
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id; // unique ID on Android
    }

    if (deviceId != null && deviceId.length < 4) {
      if (Platform.isAndroid) {
        deviceId += '_android';
      } else if (Platform.isIOS) {
        deviceId += '_ios___';
      }
    }
    if (Platform.isAndroid) {
      deviceId ??= 'flutter_user_id_android';
    } else if (Platform.isIOS) {
      deviceId ??= 'flutter_user_id_ios';
    }

    final userId = md5
        .convert(utf8.encode(deviceId!))
        .toString()
        .replaceAll(RegExp(r'[^0-9]'), '');
    return userId.substring(userId.length - 6);
  }
}
