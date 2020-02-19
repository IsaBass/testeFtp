import 'dart:io';

import 'package:path_provider/path_provider.dart';


 Directory downloadDirectory;
 Future<Directory> getDefaultDownloadDirectory() async {
    if (Platform.isAndroid) {
      Directory dir = await getExternalStorageDirectory();
      return Directory(dir.path + "/RemoteFiles");
    } else {
      return getApplicationDocumentsDirectory();
    }
  }

Future<Directory> getDownloadDirectory() async {
    Directory defaultDownloadDirectory = await getDefaultDownloadDirectory();

    return Directory(defaultDownloadDirectory.path);
    /*return Directory(box.get(
      "downloadDirectoryPath",
      defaultValue: defaultDownloadDirectory.path,
    ));*/
  }
