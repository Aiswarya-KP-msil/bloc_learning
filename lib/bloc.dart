import 'dart:async';

class CounterBLoC{
  //Stream controller to handle event stream
  final _eventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventStream => _eventController.stream;
  Sink<CounterEvent> get eventSink => _eventController.sink;

  //Stream controller to handle counter stream
  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  int _counter = 0;


  CounterBLoC(){
    eventStream.listen((CounterEvent event) {
      if(event == CounterEvent.Increment){
        ++_counter;
        counterSink.add(_counter);
      }else{
        --_counter;
        counterSink.add(_counter);
      }
    });
  }
  void dispose(){
    _counterController.close();
    _eventController.close();
  }
}

enum CounterEvent{
  Increment,
  Decrement
}

