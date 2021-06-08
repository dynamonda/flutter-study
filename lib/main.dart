import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noveler/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Novel memo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novel Memos'),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('次へ'),
          onPressed: () async {
            // ボタンを押した時
            // 実は結果を受け取る事ができる

            // async: 「止める関数だよー」と知らせる
            // await: 「時間かかるからちょっとまっててー」と指示する
            final result = await Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => NextPage('次のページに行きました！')
              )
            );
            print(result);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
