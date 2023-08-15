import 'dart:io';

import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Folder{

  Future<Directory> createDir() async {
    var status = await Permission.storage.status;
    Directory? dir;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if(Platform.isAndroid){
      dir = await getExternalStorageDirectory();
    }else if(Platform.isIOS){
      dir = await getApplicationDocumentsDirectory();
    }
    return dir!;
  }
  Future<String> createDBDirectory() async {

    Directory? dir = await createDir();
    String path = dir.path;
    String savePath = '$path/$dbName';
    return savePath;
  }

}