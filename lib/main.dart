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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'foo text',
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: KeyboardListener(),
            )
          ],
        ),
      ),
    );
  }
}

class KeyboardListener extends StatefulWidget {
  KeyboardListener();

  @override
  _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
}

class _RawKeyboardListenerState extends State<KeyboardListener> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _textNode = new FocusNode();
  StringBuffer output;

  @override
  initState() {
    super.initState();
  }

  handleKey(RawKeyEventDataAndroid key) {
    
    //print('Key: ${key.codePoint}');
    if (key.codePoint == 113){

      //output.writeCharCode(2309);
      output.write(String.fromCharCode(2309));
    }
    // else if (key.codePoint == 119){
    //   output.write(String.fromCharCode(2310));
    // }else if (key.codePoint == 101){
    //   output.write(String.fromCharCode(2311));
    // }else if (key.codePoint == 114){
    //   output.write(String.fromCharCode(2312));
    // }else if (key.codePoint == 116){
    //   output.write(String.fromCharCode(2313));
    // }else if (key.codePoint == 121){
    //   output.write(String.fromCharCode(2314));
    // }
    
    _controller.text = output.toString();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: (key) => handleKey(key.data),
      child: TextField(
        controller: _controller,
      ),
 
    );
  }
}