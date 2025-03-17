import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExcelProvider with ChangeNotifier {
  double temperature = 0.0;
  double k = 0.0;
  double phosphorus = 0.0;
  double moisture = 0.0;
  double ec = 0.0;
  double nitrogen = 0.0;
  double ph = 0.0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadDataFromFirebase() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('sensor_data')
          .orderBy('Day', descending: true) // assuming you have a 'Day' field
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var latestDoc = querySnapshot.docs.first.data() as Map<String, dynamic>;

        temperature = latestDoc['Temperature (°C)'] ?? 0.0;
        ph = latestDoc['pH'] ?? 0.0;
        nitrogen = latestDoc['Nitrogen (%)'] ?? 0.0;
        phosphorus = latestDoc['Phosphorus (%)'] ?? 0.0;
        moisture = latestDoc['Moisture Content (%)'] ?? 0.0;
        ec = latestDoc['Electrical Conductivity (dS/m)'] ?? 0.0;
        k = latestDoc['Potassium (%)'] ?? 0.0;
        print("🔥 Data fetched: $latestDoc");

        notifyListeners();
      } else {
        print("❌ No documents found in 'sensor_data'.");
      }
    } catch (e) {
      print("⚠️ Firestore error: $e");
    }
  }
}
