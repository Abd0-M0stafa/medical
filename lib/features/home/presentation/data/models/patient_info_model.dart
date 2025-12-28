class PatientInfoModel {
  final String state;
  String alert;
  final String temp;
  final String oxygen;
  final String heartRate;

  PatientInfoModel({
    required this.state,
    required this.alert,
    required this.temp,
    required this.oxygen,
    required this.heartRate,
  });

  factory PatientInfoModel.fromJson(Map<String, dynamic> json) {
    return PatientInfoModel(
      state: json['state'],
      alert: json['alert'],
      temp: json['temp'].toString(),
      oxygen: json['spo2'].toString(),
      heartRate: json['bpm'].toString(),
    );
  }
}
