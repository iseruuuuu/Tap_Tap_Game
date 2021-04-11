import 'package:flutter/material.dart';

//TODO タイトル画面の作成
//TODO ステージの作成（レベル５ぐらいまでかな？）
//TODO 制限時間の設定
//TODO 相手（COM）OR 数を０にするゲーム
//TODO
//TODO


//TODO 相手(COM)を作成する
//TODO 引き算
//TODO 毎秒何回敵がタップするのか

class ThirdScreen extends StatefulWidget {
  @override
  Third createState() => Third();
}

class Third extends State {

  //値設定
  int Playerscore = 50;
  int EnemyScore = 50;

  void _Pincrement() {
    setState(() {
      EnemyScore--;
    });
  }

  void _Eincrement() {
    setState(() {
      Playerscore--;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Level２'),
        ),
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text('$EnemyScore'),

              SizedBox(height: 50,),

              Text('$Playerscore'),

              new RaisedButton(
                  onPressed: (){
                    _Pincrement();
                  }
              ),
            ],
          ),
        )
    );
  }
}

