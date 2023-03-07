//creacion del stream
Stream<int> getNumbers() async* {
  for (var i = 1; i <= 10; i++) {
    yield i;
    //imprime numeros del 1 al 10 con 1 segundo de demora
    await Future.delayed(const Duration(seconds: 1));
  }
}

void main() {
  //suscripcion al stream
  getNumbers().listen(print);
}
