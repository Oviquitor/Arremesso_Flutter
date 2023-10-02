import 'dart:io';
import 'package:farm/stores/Resultado.dart';
import 'package:get_it/get_it.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class GeraTabelaGrafico {
  var getResultado = GetIt.I<Resultado>();
  // Cabeçalhos das colunas
  final headers = ['Nº', 'Lado Esquerdo', 'Lado Direito'];

  void criaTabelaGrafico(List esquerda, List direita) async {
    final pdf = Document();
    int n = 1;

    final table = Table.fromTextArray(
      headers: headers,
      data: List.generate(
        esquerda.length,
        (index) => [
          n++,
          esquerda[index].toString(),
          direita[index].toString(),
        ],
      ),
      cellAlignment: Alignment.center,
      cellStyle: TextStyle(fontSize: 15),
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      border: TableBorder.all(width: 2, color: PdfColors.grey),
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey,
      ),
      columnWidths: {
        0: FractionColumnWidth(0.1), // Largura da primeira coluna
        1: FractionColumnWidth(0.4), // Largura da segunda coluna
        2: FractionColumnWidth(0.4), // Largura da terceira coluna
      },
    );
    Column _buildChart(List data) {
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
          height: 60,
          width: data[i] * scaleFactor * 2,
          decoration: BoxDecoration(
              color: PdfColors.green,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))),
        );

        final label = Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Text('${data[i]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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

    // pdf.addPage(
    //   MultiPage(
    //     build: (Context context) => [
    //       Container(
    //         child: table,
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(top: 510),
    //         child: Center(
    //           child: Text(
    //             'Gráfico',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.only(top: 50),
    //         child: _buildChart(getResultado.EntradaCalculo),
    //       ),
    //     ],
    //   ),
    // );

    // Adicione sua segunda página ao PDF.
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 50),
          child: _buildChart(getResultado.EntradaCalculo),
        );
      },
    ));

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/Arremesso2.pdf';
    final File file = File(path);

    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  }
}
