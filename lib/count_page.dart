import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CountPage()));

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPage();
}

class _CountPage extends State<CountPage> {
  //カウントアップ変数
  int number = 0;
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
            Text(number.toString()),
            ElevatedButton(
              onPressed: () => {countUp()},
              child: Text("カウントアップ"),
            )
          ],
        ),
      ),
    );
  }

  //カウントアップする処理
  void countUp() {
    print("カウントアップする処理");
    number = number + 1;
    setState(() {});
  }
}
