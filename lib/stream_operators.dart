//creacion del stream
Stream<int> getNumbers() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 1 segundo de demora
    await Future.delayed(const Duration(seconds: 1));
  }
}

Stream<int> getNumbersDuplicates() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    yield i;
    //imprime numeros del 1 al 3 con 1 segundo de demora
    await Future.delayed(const Duration(seconds: 1));
  }
}

void main() {
  // expand();
  // map();
  // skip();
  // skipWhile();
  // take();
  // takeWhile();
  // where();
  // distinct();
  chaining();
}

void expand() {
  getNumbers().expand((data) => [data, data * 10]).listen(print);
  /* -----------Salida : -----------*/
  /* -----------1 -----------*/
  /* -----------10 -----------*/
  /* -----------2 -----------*/
  /* -----------20 -----------*/
  /* -----------3 -----------*/
  /* -----------30 -----------*/
}

void map() {
  // getNumbers().map((i) => i * 10).listen(print);
  /* -----------Salida : -----------*/
  /* -----------10 -----------*/
  /* -----------20 -----------*/
  /* -----------30 -----------*/
  getNumbers().map((i) {
    if (i % 2 == 0) {
      return i * 2;
    } else {
      return i - 1;
    }
  }).listen(print);

  /* -----------Salida : -----------*/
  /* -----------0 -----------*/
  /* -----------4 -----------*/
  /* -----------2 -----------*/
}

void skip() {
  //devuelve todos los numero despues del 2
  getNumbers().skip(2).listen(print);
}

void skipWhile() {
  //elimina todos los numeros menores que 3
  getNumbers().skipWhile((i) => i < 8).listen(print);
}

void take() {
  //toma los primeros dos numeros
  getNumbers().take(2).listen(print);
}

void takeWhile() {
  //toma los numeros que son menores que 3
  getNumbers().takeWhile((i) => i < 3).listen(print);
}

void where() {
  // devuelve todos los impares
  getNumbers().where((event) => event % 2 != 0).listen(print);
}

void distinct() {
  //devuelve todos los numeros distintos o los no repetidos
  getNumbersDuplicates().distinct().listen(print);
}

void chaining() {
  // primero elimina los duplicados, despues los multiplica por 10 
  // y deja todos los numero que sean distintos a 20
  // paso 1 : salida : 1,2,3
  // paso 2 : salida : 10,20,30
  // paso 3 : salida : 10,30
  getNumbersDuplicates()
      .distinct()
      .map((event) => event * 10)
      .where((event) => event != 20)
      .listen(print);
}
