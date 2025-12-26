// auth_view_model.dart
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String? gender;
  String? patientStatus;

  void setGender(String? value) {
    gender = value;
    notifyListeners();
  }

  void setPatientStatus(String? value) {
    if (value == null) return;
    patientStatus = value;
    notifyListeners();
  }
}
