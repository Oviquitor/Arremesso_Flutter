import 'package:farm/repository/HistoricoRepositorio.dart';
import 'package:mobx/mobx.dart';
part 'Resultado.g.dart';

class Resultado = _ResultadoBase with _$Resultado;

abstract class _ResultadoBase with Store {
  @observable
  double NDistancia = 0.5;

  @observable
  int NColetores = 0;

  @observable
  int NPassadas = 0;

  @observable
  String Data = '';

  @observable
  String resultado = "";

  @observable
  List EntradaCalculo = [];

  @observable
  List<double> LadoDir = [];

  @observable
  List<double> LadoEsq = [];

  @observable
  List<Map<String, dynamic>> resposta = [];

  @action
  Future<dynamic> buscarDados() async {
    resposta = await HistoricoRepositorio.getAllData();
  }

  void adicionarLista(
      List<double> esquerda, List<double> direita, List valores) {
    clearData();
    LadoDir.addAll(direita);
    LadoEsq.addAll(esquerda);
    EntradaCalculo.addAll(valores);
  }

  void adicionarValores(double nDistancia, int nColetores, int nPassadas) {
    NDistancia = nDistancia;
    NColetores = nColetores;
    NPassadas = nPassadas;
  }

  void ultimoValor() async {
    var lista = await HistoricoRepositorio.getLast();
    if (lista.isNotEmpty) {
      var temp = lista[0]['EntradaCalculo'].split("-");
      EntradaCalculo = temp.map((valor) => double.parse(valor)).toList();
      temp = lista[0]['ResultadoDir'].split("-");
      LadoDir =
          List<double>.from(temp.map((valor) => double.parse(valor)).toList());
      temp = lista[0]['ResultadoEsq'].split("-");
      LadoEsq =
          List<double>.from(temp.map((valor) => double.parse(valor)).toList());
    }
  }

  void listar() async {
    resposta = await HistoricoRepositorio.getAllData();
    ultimoValor();
  }

  void clearData() {
    LadoDir.clear();
    LadoEsq.clear();
    EntradaCalculo.clear();
  }

  void singleData(String data) async {
    resposta = await HistoricoRepositorio.getSingleData(data);
    ultimoValor();
  }

  void deletarLista() async {
    clearData();
    await HistoricoRepositorio.deleteAll();
    resposta = await HistoricoRepositorio.getAllData();
  }
}
