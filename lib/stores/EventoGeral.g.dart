// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventoGeral.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventoGeral on _EventoGeralBase, Store {
  late final _$usuarioAtom =
      Atom(name: '_EventoGeralBase.usuario', context: context);

  @override
  List<Map<String, dynamic>> get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(List<Map<String, dynamic>> value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  @override
  String toString() {
    return '''
usuario: ${usuario}
    ''';
  }
}
