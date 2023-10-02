class EntradaModel {
  double _NDistancia = 0.5;
  int _NColetores = 0;
  int _NPassadas = 0;

  double get NDistancia => _NDistancia;
  int get NColetores => _NColetores;
  int get NPassadas => _NPassadas;

  void setNDistancia(double valor) {
    if (valor == _NDistancia) return;
    _NDistancia = valor;
  }

  void setNColetores(int valor) {
    if (valor == _NColetores) return;
    _NColetores = valor;
  }

  void setNPassadas(int valor) {
    if (valor == _NPassadas) return;
    _NPassadas = valor;
  }
}
