import 'dart:io';

class Internet {
  String? title;

  Internet({this.title}) {
    title ??= 'No Internet Connection';
  }

  Future<bool> isAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
