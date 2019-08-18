import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fontsList = [
    'k010',
    'Krutidev',
    'ARJUN',
    'DevLys'
  ];
  String selectedFont = 'Krutidev';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Marathi text',
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: TextField( 
                style: TextStyle(
                  fontFamily: selectedFont,
                  fontSize: 28,
                ),
              ),
            ),
            DropdownButton(
              value: selectedFont,
              onChanged: (String selectedValue){
                setState(() {
                  selectedFont = selectedValue;
                });
              },
              items: fontsList.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

// class KeyboardListener extends StatefulWidget {
//   KeyboardListener();

//   @override
//   _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
// }

// class _RawKeyboardListenerState extends State<KeyboardListener> {
//   TextEditingController _controller = new TextEditingController();
//   FocusNode _textNode = new FocusNode();
//   String text = "";
//   StringBuffer content = new StringBuffer();

//   @override
//   initState() {
//     super.initState();
//   }
  

//   handleKey(RawKeyEventDataAndroid key) {
    
//     //print('Key: ${key.codePoint}');
//     if(key.codePoint == 0){
//       content.clear();
//     }else if (key.codePoint == 113){
//       //text += String.fromCharCode(2309);
//       content.writeCharCode(2309);
//     } else if (key.codePoint == 119){
//       //text += String.fromCharCode(2310);
//        content.writeCharCode(2310);
//     }else if (key.codePoint == 101){
//       //text += String.fromCharCode(2311);
//        content.writeCharCode(2311);
//     }else if (key.codePoint == 114){
//       //text += String.fromCharCode(2312);
//        content.writeCharCode(2312);
//     }else if (key.codePoint == 116){
//       //text += String.fromCharCode(2313);
//        content.writeCharCode(2313);
//     }else if (key.codePoint == 121){
//       //text += String.fromCharCode(2314);
//        content.writeCharCode(2314);
//     }
    
//     var curPos = _controller.selection;
//     _controller.text = content.toString();
//     if (curPos.start > _controller.text.length){
//       curPos = new TextSelection.fromPosition(
//         new TextPosition(offset: _controller.text.length)
//       );
//     }
//     _controller.selection = curPos;
//     print(key.codePoint);
//     //_controller.text = text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RawKeyboardListener(
//       focusNode: _textNode,
//       onKey: (key) => handleKey(key.data),
//       child: TextField(
//         //controller: _controller,
//         style: TextStyle(
//           fontFamily: 'k010',
//         ),
//       ),
//     );
//   }
// }