import 'package:farm/repository/UsuarioRepositorio.dart';
import 'package:mobx/mobx.dart';
part 'EventoGeral.g.dart';

class EventoGeral = _EventoGeralBase with _$EventoGeral;

abstract class _EventoGeralBase with Store {
  @observable
  List<Map<String, dynamic>> usuario = [];

  void listaDados() async {
    usuario = await UsuarioRepositorio.getAllData();
  }

  void listaDado(String dado) async {}
}
