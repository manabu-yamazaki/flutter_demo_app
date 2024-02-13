import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/firebase_options.dart';
import 'package:flutter_demo_app/next_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'パスワードポスト',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'パスワードポスト Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter × Firebase'),
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(titleList[i])));
                },
                leading: Icon(Icons.vpn_key),
                title: Text(titleList[i]),
              ),
              Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleList.add('');
          // print(titleList);
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//todo ホーム画面のタイトル変更
//todo リストを表示
//todo リスト間に区切り線を表示
//todo リスト表示を動的に
//todo フロートアクションボタンをタップ字に、リストを一つ追加表示
//todo 新しい画面を作成し、リストをタップした時に遷移
//todo 新しいレイアウト作成
//todo 新しい画面にリストからデータを引き継ぐ