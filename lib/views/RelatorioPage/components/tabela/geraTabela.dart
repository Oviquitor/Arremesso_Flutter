import 'dart:io';
import 'package:farm/stores/Resultado.dart';
import 'package:get_it/get_it.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GerarTabela {
  var getResultado = GetIt.I<Resultado>();

  // Cabeçalhos das colunas
  final headers = ['Nº', 'Lado Esquerdo', 'Lado Direito'];

  void criaTable(List esquerda, List direita) async {
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

    pdf.addPage(
      MultiPage(
        build: (Context context) => [
          table,
          Container(
            padding: const EdgeInsets.only(top: 20),
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
