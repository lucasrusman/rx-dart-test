import 'dart:async';
//broadcast es para escuchar multiples streams de un mismo controller
StreamController<String> _ctrl = StreamController<String>.broadcast();
Stream<String> get out => _ctrl.stream;
void main() {
  //stream 1
  out.listen(print);
  //stream 2
  out.listen( (data) => print(data.replaceAll('a', 'b')));
  add();
}

void add() {
  _ctrl.sink.add('somedata');
}
