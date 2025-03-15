import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String fullName = "Michael John";
  String position = "Senior Plant Manager";
  String email = "michaeljohn@gmail.com";
  String phone = "9685438990";
  String department = "Production";
  String location = "Plant B";

  // ✅ Function to update user details
  void updateUser(String name, String pos, String mail, String ph, String dept,
      String loc) {
    fullName = name;
    position = pos;
    email = mail;
    phone = ph;
    department = dept;
    location = loc;
    notifyListeners(); // ✅ Notify UI to update
  }
}
/*
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserProvider extends ChangeNotifier {
  // Existing user details
  String fullName = "Michael John";
  String position = "Senior Plant Manager";
  String email = "michaeljohn@gmail.com";
  String phone = "9685438990";
  String department = "Production";
  String location = "Plant B";

  List<List<dynamic>> excelData = []; // To store Excel values

  // ✅ Function to update user details
  void updateUser(String name, String pos, String mail, String ph, String dept, String loc) {
    fullName = name;
    position = pos;
    email = mail;
    phone = ph;
    department = dept;
    location = loc;
    notifyListeners(); // Notify UI to update
  }

  // ✅ Function to fetch Excel data
  Future<void> fetchExcelData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/your_file.xlsx"; // Change the file name
      var bytes = File(filePath).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      List<List<dynamic>> tempData = [];

      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          tempData.add(row.map((cell) => cell?.value).toList());
        }
      }

      excelData = tempData;
      notifyListeners(); // Notify UI to refresh

    } catch (e) {
      print("Error reading Excel file: $e");
    }
  }
}*/