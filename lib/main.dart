import 'package:apollo_app/api_page.dart';
import 'package:apollo_app/count_page.dart';
import 'package:apollo_app/next_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("アポロ計画"),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              tile(),
            ],
          ),
        ),
      ),
    );
  }
}

class tile extends StatelessWidget {
  const tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1513123453247049729/FwpwbhZC_400x400.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("たけだ"),
                    SizedBox(width: 8),
                    Text("2023/08/18"),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text("最高でした"),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => {
              // ボタンを押された時の処理を記載する
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()),
              )
            },
            child: const Text("ボタン"),
          ),
          ElevatedButton(
            onPressed: () => {
              // ボタンを押された時の処理を記載する
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CountPage()),
              )
            },
            child: const Text("カウントアップ"),
          ),
          ElevatedButton(
            onPressed: () => {
              // ボタンを押された時の処理を記載する
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApiPage()),
              )
            },
            child: const Text("API通信"),
          ),
        ],
      ),
    );
  }

  void countUP() {}
}
