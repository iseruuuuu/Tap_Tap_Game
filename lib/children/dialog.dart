import 'package:flutter/material.dart';

class goodDialog extends StatelessWidget {
  const goodDialog({
    Key key,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    int count = 0;
    return AlertDialog(
      title: Center(child:
      Text("ゲームクリア！",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      ),
      //文字の枠を作成
      content: Container(
        color: HexColor('d4c99a'),
        width: 90,
        height: 90,

        child: Center(
          child: Text("次のレベルが解放されたぞ!!\n"
              "タイトルを確認してでみよう!!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.grey, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),

            child: Center(
              child: FlatButton(
                child: Text("タイトル", style: TextStyle(
                  color: Colors.red,fontSize: 20,
                ),),
                onPressed: () =>  Navigator.popUntil(context, (_) => count++ >= 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}










class badDialog extends StatelessWidget {
  const badDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return AlertDialog(
      title: Center(child: Text('残念!!クリアならず!!',style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      ),
      ),




      //文字の枠を作成
      content: Container(
        color: HexColor('d4c99a'),
        width: 90,
        height: 90,

        child: Center(
          child:Text("もう一度チャレンジしてみよう!!\n"
              "きっと君ならできる!!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),

      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.grey, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: FlatButton(
                child: Text('リトライ', style: TextStyle(
                    color: Colors.blue,fontSize: 20
                ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.grey, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),

            child: Center(
              child: FlatButton(
                child: Text("タイトル", style: TextStyle(
                  color: Colors.red,fontSize: 20,
                ),),
                onPressed: () =>  Navigator.popUntil(context, (_) => count++ >= 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}













//まだ解放されていないよダイアログ
class CannotDialog extends StatelessWidget {
  const CannotDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return AlertDialog(
      title: Center(child: Text('未解放',style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      ),
      ),




      //文字の枠を作成
      content: Container(
        height: 50,
        child: Center(
          child:Text('上から順番に挑戦しよう！\n'
              "クリアすると解放されるぞ！",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),

      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.grey, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: FlatButton(
                child: Text('戻る', style: TextStyle(
                    color: Colors.red,fontSize: 20
                ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}