import 'package:flutter/material.dart';

class _Rect {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const _Rect({required this.backgroundColor, required this.textColor, required this.text});


}

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  List<_Rect> _getRects() => [
    const _Rect(backgroundColor: Colors.white, textColor: Colors.black, text: 'Белый'),
    const _Rect(backgroundColor: Colors.black, textColor: Colors.white, text: 'Черный'),
    const _Rect(backgroundColor: Colors.blue, textColor: Colors.red, text: 'Синий')
  ];

  @override
  Widget build(BuildContext context) {
    var rects = _getRects();

    return Scaffold(
      appBar: AppBar(
        title: const Text('App 1'),
      ),
      body: ListView.builder(
        itemCount: rects.length,
        itemBuilder: (context, index)
          => Container(
            color: rects[index].backgroundColor,
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(rects[index].text, style: TextStyle(color: rects[index].textColor),),
            ),
          ),
      ),
    );
  }
}
