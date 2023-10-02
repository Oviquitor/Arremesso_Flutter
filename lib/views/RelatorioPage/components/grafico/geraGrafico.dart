import 'dart:io';
import 'package:farm/stores/Resultado.dart';
import 'package:get_it/get_it.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GerarGrafico {
  var getResultado = GetIt.I<Resultado>();

  void criaGrafico(List esquerda, List direita) async {
    final pdf = Document();

    Widget _buildChart(List data) {
      final maxValue = data.reduce((max, value) => max > value ? max : value);
      var max = maxValue.toString().length.toDouble();
      var dt = 0.0;
      final scaleFactor = 100 / maxValue;
      final List<Widget> bars = [];

      for (var i = 0; i < data.length; i++) {
        dt = data[i].toString().length.toDouble();
        final emptySpace = Container(
          height: 15,
          width: (((max - dt) * 8) + 5),
        );

        final bar = Container(
          height: 20,
          width: data[i] * scaleFactor,
          color: PdfColors.green,
        );

        final label = Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text('${data[i]}',
              style: TextStyle(fontWeight: FontWeight.bold)),
        );

        final row = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [label, emptySpace, bar],
        );

        bars.add(row);
      }

      final chart = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bars,
      );

      return chart;
    }

    pdf.addPage(
      MultiPage(
        build: (Context context) => [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: _buildChart(getResultado.EntradaCalculo),
          ),
        ],
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/Arremesso2.pdf';
    final File file = File(path);

    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  }
}
