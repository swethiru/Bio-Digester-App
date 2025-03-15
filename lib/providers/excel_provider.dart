/*import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';

class ExcelProvider extends ChangeNotifier {
  //List<List<dynamic>> excelData = [];
  // Define fields to hold your Excel data
  String temperature = "--";
  String oxygenLevel = "--";
  String humidity = "--";
  double methaneLevel = 0.0;
  String gasProduction = "--";

  Future<void> loadExcelData() async {
    try {
      ByteData data = await rootBundle.load('data1.xlsx');
      print('Loaded data1.xlsx, ${data.lengthInBytes} bytes');

      var bytes = data.buffer.asUint8List();
      var excel = Excel.decodeBytes(bytes);

      if (excel.tables.isEmpty) {
        print("No sheets found in Excel file.");
        return;
      }

      var sheetName = excel.tables.keys.first;
      var sheet = excel.tables[sheetName];

      if (sheet == null || sheet.rows.isEmpty) {
        print("Sheet is empty or invalid.");
        return;
      }

      // Update fields based on the expected structure.
      // Adjust indices as per your file's structure.
      temperature = sheet.rows[1][1]?.value.toString() ?? "--";
      oxygenLevel = sheet.rows[2][1]?.value.toString() ?? "--";
      humidity = sheet.rows[3][1]?.value.toString() ?? "--";
      methaneLevel =
          double.tryParse(sheet.rows[4][1]?.value.toString() ?? "0") ?? 0.0;
      gasProduction = sheet.rows[5][1]?.value.toString() ?? "--";

      // Debug: Print each row's content
      /*for (int i = 0; i < sheet.rows.length; i++) {
      print("Row $i: ${sheet.rows[i].map((cell) => cell?.value).toList()}");
    }

    setState(() {
      temperature = sheet.rows[1][1]?.value.toString() ?? "--";
      oxygenLevel = sheet.rows[2][1]?.value.toString() ?? "--";
      humidity = sheet.rows[3][1]?.value.toString() ?? "--";
      methaneLevel =
          double.tryParse(sheet.rows[4][1]?.value.toString() ?? "0") ?? 0.0;
      gasProduction = sheet.rows[5][1]?.value.toString() ?? "--";
    });*/

      //checkCriticalConditions(context, methaneLevel);
      // Notify listeners so that any widget using this provider will rebuild.
      notifyListeners();
    } catch (e) {
      print("Error loading Excel file: $e");
    }
  }

  Future<void> loadExcelData() async {
    try {
      ByteData data = await rootBundle.load('data1.xlsx');
      var bytes = data.buffer.asUint8List();
      var excel = Excel.decodeBytes(bytes);

      // Debugging: Print sheet names
      print('Sheets: ${excel.tables.keys}');
    } catch (e) {
      print('Error loading Excel file: $e');
    }

    //List<List<dynamic>> tempData = [];

    //for (var table in excel.tables.keys) {
    //for (var row in excel.tables[table]!.rows) {
    //tempData.add(row.map((cell) => cell?.value).toList());
  }
}

  //excelData = tempData;
  //notifyListeners();
  //}
//}
}
*/

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExcelProvider extends ChangeNotifier {
  String temperature = "--";
  String oxygenLevel = "--";
  String humidity = "--";
  double methaneLevel = 0.0;
  String gasProduction = "--";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Load data dynamically from Firestore
  void loadDataFromFirebase() {
    _firestore
        .collection("biogas_data")
        .doc("current")
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        var data = snapshot.data();
        temperature = data?["temperature"]?.toString() ?? "--";
        oxygenLevel = data?["oxygenLevel"]?.toString() ?? "--";
        humidity = data?["humidity"]?.toString() ?? "--";
        methaneLevel =
            double.tryParse(data?["methaneLevel"]?.toString() ?? "0") ?? 0.0;
        gasProduction = data?["gasProduction"]?.toString() ?? "--";

        notifyListeners(); // Notify UI to update
      }
    });
  }
}
