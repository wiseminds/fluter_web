import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Welcome'),
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
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            FlutterLogo(), SizedBox(width: 40),
            Text(widget.title),
          ],
        ),
        actions: <Widget>[
          if(MediaQuery.of(context).size.width > 700)
          for (var item in [0,3,2,65,45]) 
          FlatButton(onPressed: (){}, child: Tooltip(
            message: 'Navigate to home page',
            child: Text('Home')))
        ],
      ),
      drawer: (MediaQuery.of(context).size.width > 700) ? null : Drawer(),
      body: LayoutBuilder(
              builder:(c, bc)=> GridView.count(crossAxisCount: 
        MediaQuery.of(context).size.width > 700 ? 10 : 5,
          children: <Widget>[
            for (var i = 1; i < _counter; i++) 
            Card(
            child: InkWell(onTap: (){}, 
              child: Center(child: Text('Text $i')))
          )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
