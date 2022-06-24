import 'package:bloc_learning_example/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter BLoC Pattern Example '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBLoC _counterBLoC = CounterBLoC();
  @override
  void dispose(){
    _counterBLoC.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text(
              'Click on Floating button ,'
                  ' increment and decrement  count here:',
            ),
            StreamBuilder<int>(
              stream: _counterBLoC.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  final counter =snapshot.data;
                  return Text(
                    '$counter',
                  );
                }
            )
          ],
        ),
      ),

      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          FloatingActionButton(
            onPressed:incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: decrementCounter,
            tooltip: 'Decrement',
            child: Text("-"),)
        ]

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void incrementCounter(){
    _counterBLoC.eventSink.add(CounterEvent.Increment);
  }
  void decrementCounter(){
    _counterBLoC.eventSink.add(CounterEvent.Decrement);
  }
}


