import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_tap_app/stagee_last.dart';
import 'package:tap_tap_app/stage_first.dart';
import 'package:tap_tap_app/stage_second.dart';
import 'package:tap_tap_app/stage_third.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'children/dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());

}

//TODO タイトル画面の作成　　　　　　　　　　　　　　達成!!
//TODO ステージの作成（レベル５ぐらいまでかな？　　　達成!!
//TODO 制限時間の設定　　　　　　　　　　　　　　　　達成!!
//TODO 相手（COM）OR 目標を作成する。　　　　　　　達成!!!
//TODO ボタンの作成　　　　　　　　　　　　　　　　　達成!!
//TODO 文字の配列やデザイン　　　　　　　　　　　　　達成!!
//TODO 画面遷移　　　　　　　　　　　　　　　　　　　達成!!
//TODO 画面を縦に固定する。　　　　　　　　　　　　　達成!!
//TODO shared_preferences: ^0.4.3を登録　　達成!!
//TODO bool型を作成　　　　　　　　　　　　　　達成!!
//TODO false--> 灰色　　　　　　　　　　　　　　達成!!
//TODO false--> ボタンを押せないようにする　　　達成!!
//TODO true---> 赤色　　　　　　　　　　　　　　達成!!
//TODO true---> ボタンを押せる　　　　　　　　　達成!!
//TODO MindMemoを参考にしてパクる　　　　　　　達成!!
//TODO SetStateで常に変更する　　　　　　　　　達成!!!
//TODO クリアするとtrueにする。　　　　　　　　　変更!!
//TODO ・クリアすると値を増やしてsetStateで変化したらboolを変えてあげる　達成!!
//TODo ・初めの値を0にする。　　　　　　　　　　　　　　　　　　　　　　　　達成!!
//TODO ・クリアしたら値を1にしてあげる。　　　　　　　　　　　　　　　　　　達成!!
//TODO ・数字を保存してtrue,falseを管理しても良さそう。。　　　　　　　　　達成!!
//TODO 数字を保存する　　　達成!!
//TODO 数字を出力する。　　達成!!
//TODO 数字を書き換える。　達成!!
//TODO 数字を反映する。　　達成!!


//TODO 色の変化をボタンを押した時に変化させる。
//TODO 色を保存する。(sharePrefrence)を使用して






class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:  '/',
      routes: {
        '/first': (_) => FirstScreen(),
        '/second': (_) => SecondScreen(),
        '/third': (_) => ThirdScreen(),
        '/last': (_) => LastScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState(0,0,0);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.Stage2, this.Stage3, this.Stage999);
  final int Stage2;
  final int Stage3;
  final int Stage999;

  double width = 300;
  double height = 60;
  double size = 30;
  double size2 = 50;

  //false ->プレイできないようにする。
  bool stage1 = true;
  bool stage2 = false;
  bool stage3 = false;
  bool stage999 = false;

  int touch = 0;



  Future<void> save(key,bool) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, bool);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    //TODO 数字を保存 OR Boolを保存する　かきめる。。。
    //  stage2 = prefs.getBool('stage2');
    //  stage3 = prefs.getBool('stage3');
    //  stage999 = prefs.getBool('stage999');

    /*
    print(stage1);
    //nullになっている
    print(stage2);
    print(stage3);
    print(stage999);
     */
  }

  void initState() {
    super.initState();
    load();
    load2();
    selectColor2();
   // print('$stage2 ssss');
  }



  Future<void> save2() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Stage2', 0);
    prefs.setDouble('Stage3', 0);
    prefs.setDouble('Stage999', 0);
  }

  Future<void> load2() async {
    //足した数字を記憶する。
    final prefs = await SharedPreferences.getInstance();

    int counter = (prefs.getInt('counter') ?? 0) + 0;
    int counter2 = (prefs.getInt('counter2') ?? 0) + 0;
    int counter3 = (prefs.getInt('counter3') ?? 0) + 0;

  //  print('Pressed $counter times.');
  //  print('Pressed $counter2 times.');
  // print('Pressed $counter3 times.');

    await prefs.setInt('counter', counter);
    await prefs.setInt('counter2', counter2);
    await prefs.setInt('counter3', counter3);

    if (counter >= 1) {
      stage2 = true;
      print('$stage2 jjjhjhjh');
      //TODO 色を変えたい
      selectColor2();
    }

    if (counter2 >= 1) {
      stage3 = true;
      print(stage3);
      //TODO 色を変えたい
      selectColor3();
    }

    if (counter3 >= 1) {
      stage999 = true;
      print(stage999);
      //TODO 色を変えたい
      selectColor999();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('超・連打ゲーム',style: TextStyle(
              fontSize: size2),
            ),
            ButtonTheme(
              minWidth:width,
              height: height,
              child: RaisedButton(
                  child: Text('Level1'
                    ,style: TextStyle(fontSize: size,),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed:(){ Navigator.of(context).pushNamed('/first');}
              ),
            ),


            ButtonTheme(
              minWidth:width,
              height: height,
              child: RaisedButton(
                  child: Text('Level2'
                    ,style: TextStyle(fontSize: size,),
                  ),
                  color: selectColor2(),
                  textColor: Colors.white,
                  onPressed: () {
                    if (touch == 0) {
                      load2();
                      //TODO 色を変えたい。

                      //TODO 色を固定させたい。


                      selectColor2();
                      touch++;
                      print(touch);
                    } else {
                      if (stage2 == false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const CannotDialog();
                          },
                        );
                      } else {
                        Navigator.of(context).pushNamed('/second');
                      }
                    }
                  }
              ),
            ),


            ButtonTheme(
              minWidth:width,
              height: height,
              child: RaisedButton(
                  child: Text('Level3'
                    ,style: TextStyle(fontSize: size,),
                  ),
                  color: selectColor3(),
                  textColor: Colors.white,
                  onPressed: (){
                    if (stage3 == false) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const CannotDialog();
                        },
                      );
                    }else{
                      Navigator.of(context).pushNamed('/third');
                    }
                  }
              ),
            ),

            ButtonTheme(
              minWidth:width,
              height: height,
              child: RaisedButton(
                  child: Text('Level999'
                    ,style: TextStyle(fontSize: size,),
                  ),
                  color: selectColor999(),
                  textColor: Colors.white,
                  onPressed: (){
                    if (stage999 == false) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const CannotDialog();
                        },
                      );
                    }else{
                      Navigator.of(context).pushNamed('/last');
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
/*
  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: Colors.indigo
    ));
  }

 */

  Color selectColor2() {
    if(stage2 == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Color selectColor3() {
    if(stage3 == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Color selectColor999() {
    if(stage999 == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}