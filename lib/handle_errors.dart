Stream<int> getNumbersError() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 3 segundo de demora
    await Future.delayed(const Duration(seconds: 3));
    if (i == 2) {
      //cuando llega al 2 imprime una excepcion
      throw Exception();
    }
  }
}

Stream<int> getNumbersTimeout() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 3 segundo de demora
    await Future.delayed(const Duration(seconds: 3));
  }
}

void main() {
  // handleError();
  timeout();
}

void handleError() {
  // lanza la excepcion despues de imprimir el 2
  getNumbersError().handleError(print).listen(print);
}

void timeout() {
  // lanza la excepcion siempre y cuando el timeout sea el mismo que 
  // el  Future.delayed(const Duration(seconds: 3)); de la funcion a la que se le 
  // coloca el timeout
  //si es distinto toma el timeout y continua la ejecucion con ese nuevo timeout
  getNumbersTimeout().timeout(const Duration(seconds: 4)).listen(print);
}
