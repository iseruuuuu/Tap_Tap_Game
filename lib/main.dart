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



//TODO 達成したら解放されるものをデータとして扱う


//TODO shared_preferences: ^0.4.3を登録　　達成!!
//TODO bool型を作成　　　　　　　　　　　　　　達成!!
//TODO false--> 灰色　　　　　　　　　　　　　　達成!!
//TODO false--> ボタンを押せないようにする　　　達成!!
//TODO true---> 赤色　　　　　　　　　　　　　　達成!!
//TODO true---> ボタンを押せる　　　　　　　　　達成!!
//TODO MindMemoを参考にしてパクる　　　　　　　
//TODO SetStateで常に変更する　　　　　　　　　達成!!
//TODO クリアするとtrueにする。　　　　　　　　　変更!!

//TODO ・クリアすると値を増やしてsetStateで変化したらboolを変えてあげる。
//TODo ・初めの値を0にする。
//TODO ・クリアしたら値を1にしてあげる。
//TODO ・数字を保存してtrue,falseを管理しても良さそう。。



//TODO 数字を保存する
//TODO 数字を出力する。
//TODO 数字を書き換える。
//TODO 数字を反映する。


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  int _counter = 0;
  bool _isRed = true;
  double width = 300;
  double height = 60;
  double size = 30;
  double size2 = 50;

  //false ->プレイできないようにする。
  bool stage1 = true;
  bool stage2 = false;
  bool stage3 = false;
  bool stage999 = false;



  Future<void> save(key,bool) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, bool);
  }

  Future<void> save2() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Stage2', 0);

  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    if (Stage2 == 1) {
      stage2 = true;
    }

    if (Stage3 == 1) {
      stage3 = true;
    }

    if (Stage999 == 1) {
      stage999 = true;
    }
    //TODO 数字を保存 OR Boolを保存する　かきめる。。。


    //  stage2 = prefs.getBool('stage2');
    //  stage3 = prefs.getBool('stage3');
    //  stage999 = prefs.getBool('stage999');

    print(stage1);
    //nullになっている
    print(stage2);
    print(stage3);
    print(stage999);
  }

  void initState() {
    super.initState();
    load();
    print(Stage2);
    print(Stage3);
    print(Stage999);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('超・連打ゲーム',style: TextStyle(
              fontSize: size2,
            ),
            ),


            ButtonTheme(
              minWidth:width,
              height: height,
              child: RaisedButton(
                  child: Text('Level1'
                    ,style: TextStyle(fontSize: size,),
                  ),
                  color: selectColor(),
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pushNamed('/first');
                  }
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
                  onPressed: (){
                    if (stage2 == false) {
                      //falseは、プレイできない。
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const CannotDialog();
                        },
                      );
                    }else{
                      //プレイできる
                      Navigator.of(context).pushNamed('/second');
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
                      //falseは、プレイできない。
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const CannotDialog();
                        },
                      );
                    }else{
                      //プレイできる
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
                      //falseは、プレイできない。
                      //TODO ダイアログとかを出す？？
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const CannotDialog();
                        },
                      );
                    }else{
                      //プレイできる
                      Navigator.of(context).pushNamed('/last');
                    }

                  }
              ),
            ),

            //Text('$_counter', style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }


  Color selectColor() {
    if(stage1 == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

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



  GamePlay() {
    if (stage1 == false) {
      _isRed = false;
    }

  }


}
