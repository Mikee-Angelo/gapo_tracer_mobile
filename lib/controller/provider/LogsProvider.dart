import 'package:app/model/CreateScanModel.dart';
import 'package:app/controller/services/LogsServices.dart';
import 'package:app/model/CivilianLogsModel.dart' as civilian;
import 'package:app/model/EstablishmentLogsModel.dart' as establishment;
import 'package:app/model/VehicleLogsModel.dart' as vehicle;
import 'package:flutter/material.dart';

class LogsProvider extends ChangeNotifier {
  List<civilian.Datum>? civilianLogs;
  List<establishment.Datum>? establishmentLogs;
  List<vehicle.Datum>? vehicleLogs;
  final _services = LogsServices();

  Future<void> getCivilianLogs() async {
    await _services.civilianLogs().then((res) {
      civilianLogs = res.data ?? [];

      notifyListeners();
    });
  }

  Future<void> getEstablishmentLogs() async {
    await _services.establishmentsLogs().then((res) {
      establishmentLogs = res.data ?? [];

      notifyListeners();
    });
  }

  Future<void> getVehicleLogs() async {
    await _services.getVehicleLogs().then((res) {
      vehicleLogs = res.data ?? [];

      notifyListeners();
    });
  }
}
