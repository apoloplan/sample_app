import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: ApiPage()));

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPage();
}

class ImageJson {
  ImageJson(this.id, this.title, this.url);
  int id;
  String title;
  String url;
}

class _ApiPage extends State<ApiPage> {
  List<ImageJson> imageJsons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アポロ', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {sendJson()},
              child: Text("カウントアップ"),
            ),
            for (final images in imageJsons)
              Row(
                children: [
                  Text(images.title),
                  Text(images.url),
                ],
              ),
          ],
        ),
      ),
    );
  }

  //カウントアップする処理
  void sendJson() async {
    var url = Uri.http('localhost:8000', '/images/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = convert.jsonDecode(response.body);
      final jsonArray = jsonBody['data'];
      print(jsonArray);
      imageJsons = [];
      for (int i = 0; i < jsonArray.length; i++) {
        final data = jsonArray[i];
        final _imagejson = ImageJson(data['id'], data['title'], data['url']);
        imageJsons.add(_imagejson);
      }
    }
    print(imageJsons);
    setState(() {});
  }
}
