import 'dart:async';

class SimpleStream<T> {
  StreamController streamController = new StreamController<T>.broadcast();

  Stream get stream => streamController.stream;

  void add(T data){
    streamController.add(data);
  }

  void addError(T data){
    streamController.addError(data);
  }

  void clearStream(){
    streamController.close();
  }
}
