// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Resultado.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Resultado on _ResultadoBase, Store {
  late final _$NDistanciaAtom =
      Atom(name: '_ResultadoBase.NDistancia', context: context);

  @override
  double get NDistancia {
    _$NDistanciaAtom.reportRead();
    return super.NDistancia;
  }

  @override
  set NDistancia(double value) {
    _$NDistanciaAtom.reportWrite(value, super.NDistancia, () {
      super.NDistancia = value;
    });
  }

  late final _$NColetoresAtom =
      Atom(name: '_ResultadoBase.NColetores', context: context);

  @override
  int get NColetores {
    _$NColetoresAtom.reportRead();
    return super.NColetores;
  }

  @override
  set NColetores(int value) {
    _$NColetoresAtom.reportWrite(value, super.NColetores, () {
      super.NColetores = value;
    });
  }

  late final _$NPassadasAtom =
      Atom(name: '_ResultadoBase.NPassadas', context: context);

  @override
  int get NPassadas {
    _$NPassadasAtom.reportRead();
    return super.NPassadas;
  }

  @override
  set NPassadas(int value) {
    _$NPassadasAtom.reportWrite(value, super.NPassadas, () {
      super.NPassadas = value;
    });
  }

  late final _$DataAtom = Atom(name: '_ResultadoBase.Data', context: context);

  @override
  String get Data {
    _$DataAtom.reportRead();
    return super.Data;
  }

  @override
  set Data(String value) {
    _$DataAtom.reportWrite(value, super.Data, () {
      super.Data = value;
    });
  }

  late final _$resultadoAtom =
      Atom(name: '_ResultadoBase.resultado', context: context);

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  late final _$EntradaCalculoAtom =
      Atom(name: '_ResultadoBase.EntradaCalculo', context: context);

  @override
  List<dynamic> get EntradaCalculo {
    _$EntradaCalculoAtom.reportRead();
    return super.EntradaCalculo;
  }

  @override
  set EntradaCalculo(List<dynamic> value) {
    _$EntradaCalculoAtom.reportWrite(value, super.EntradaCalculo, () {
      super.EntradaCalculo = value;
    });
  }

  late final _$LadoDirAtom =
      Atom(name: '_ResultadoBase.LadoDir', context: context);

  @override
  List<double> get LadoDir {
    _$LadoDirAtom.reportRead();
    return super.LadoDir;
  }

  @override
  set LadoDir(List<double> value) {
    _$LadoDirAtom.reportWrite(value, super.LadoDir, () {
      super.LadoDir = value;
    });
  }

  late final _$LadoEsqAtom =
      Atom(name: '_ResultadoBase.LadoEsq', context: context);

  @override
  List<double> get LadoEsq {
    _$LadoEsqAtom.reportRead();
    return super.LadoEsq;
  }

  @override
  set LadoEsq(List<double> value) {
    _$LadoEsqAtom.reportWrite(value, super.LadoEsq, () {
      super.LadoEsq = value;
    });
  }

  late final _$respostaAtom =
      Atom(name: '_ResultadoBase.resposta', context: context);

  @override
  List<Map<String, dynamic>> get resposta {
    _$respostaAtom.reportRead();
    return super.resposta;
  }

  @override
  set resposta(List<Map<String, dynamic>> value) {
    _$respostaAtom.reportWrite(value, super.resposta, () {
      super.resposta = value;
    });
  }

  late final _$buscarDadosAsyncAction =
      AsyncAction('_ResultadoBase.buscarDados', context: context);

  @override
  Future<dynamic> buscarDados() {
    return _$buscarDadosAsyncAction.run(() => super.buscarDados());
  }

  @override
  String toString() {
    return '''
NDistancia: ${NDistancia},
NColetores: ${NColetores},
NPassadas: ${NPassadas},
Data: ${Data},
resultado: ${resultado},
EntradaCalculo: ${EntradaCalculo},
LadoDir: ${LadoDir},
LadoEsq: ${LadoEsq},
resposta: ${resposta}
    ''';
  }
}
