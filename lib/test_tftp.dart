import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tftp/tftp.dart';

class ClientDemo extends StatefulWidget {
  @override
  _ClientDemoState createState() => _ClientDemoState();
}

class _ClientDemoState extends State<ClientDemo> {
  var host = TextEditingController();
  var port = TextEditingController();
  var local = TextEditingController();
  var remote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('teste ftp'),
      ),
      body: Container(
          child: Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            TextField(
              controller: host,
              decoration: InputDecoration(labelText: "Host"),
            ),
            TextField(
              controller: port,
              decoration: InputDecoration(labelText: "Port"),
            ),
            TextField(
              controller: local,
              decoration: InputDecoration(labelText: "Local File"),
            ),
            TextField(
              controller: remote,
              decoration: InputDecoration(labelText: "Remote File"),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Get"),
                  onPressed: () async {
                    var client = await TFtpClient.bind(
                        "0.0.0.0", 40000 + Random().nextInt(10000));
                    Directory appDocDir =
                        await getApplicationDocumentsDirectory();
                    String appDocPath = appDocDir.path;
                    client.get("$appDocPath/${local.text}", remote.text,
                        host.text, int.parse(port.text));
                  },
                ),
                RaisedButton(
                  child: Text("Put"),
                  onPressed: () async {
                    var client = await TFtpClient.bind(
                        "0.0.0.0", 40000 + Random().nextInt(10000));
                    Directory appDocDir =
                        await getApplicationDocumentsDirectory();
                    String appDocPath = appDocDir.path;
                    client.put("$appDocPath/${local.text}", remote.text,
                        host.text, int.parse(port.text));
                  },
                ),
              ],
            ),
          ],
        ).toList(),
      )),
    );
  }
}
