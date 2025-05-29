import 'package:flutter/foundation.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeViewModel extends ChangeNotifier {
  String language = 'en';
  String name = '';
  String email = '';
  String password = '';
  String city = '';
  String country = '';
  String phone = '';

  Future<void> save() async {
    final excel = Excel.createExcel();
    final Sheet sheet = excel['Sheet1'];

    // Comprovar si la fila 0 ja té títols, si no afegir-los
    var firstRow = sheet.row(0);
    if (firstRow.isEmpty) {
      sheet.appendRow([
        'Language',
        'Name',
        'Email',
        'Password',
        'City',
        'Country',
        'Phone',
      ]);
    }

    // Afegir les dades a la següent fila
    sheet.appendRow([
      language,
      name,
      email,
      password,
      city,
      country,
      phone,
    ]);

    // Guardar el fitxer a documents directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/user_data.xlsx';

    final fileBytes = excel.encode();
    if (fileBytes == null) {
      debugPrint('Error encoding excel file.');
      return;
    }
    final file = File(filePath);
    await file.writeAsBytes(fileBytes, flush: true);

    debugPrint('Data saved to $filePath');
  }
}
