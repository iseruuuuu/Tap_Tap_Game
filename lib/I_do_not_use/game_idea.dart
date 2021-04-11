import 'package:flutter/material.dart';

//TODO タイトル画面の作成
//TODO ステージの作成（レベル５ぐらいまでかな？）
//TODO 制限時間の設定
//TODO 相手（COM）OR 数を０にするゲーム
//TODO
//TODO


//TODO 相手(COM)を作成する
//TODO 引き算と足し算
//TODO 毎秒何回敵がタップするのか


class SecondScreen extends StatefulWidget {
  @override
  Second createState() => Second();
}

class Second extends State {

  //値設定
  int Playerscore = 0;
  int EnemyScore = 0;

  void _Pincrement() {
    setState(() {
      Playerscore++;
      EnemyScore--;
    });
  }

  void _Eincrement() {
    setState(() {
      Playerscore--;
      EnemyScore++;
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

