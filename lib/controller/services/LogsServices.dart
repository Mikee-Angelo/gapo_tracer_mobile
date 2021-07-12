import 'dart:convert';
import 'dart:io';

import 'package:app/model/CivilianLogsModel.dart';
import 'package:app/model/EstablishmentLogsModel.dart';
import 'package:app/model/VehicleLogsModel.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LogsServices {
  var _profileBox = Hive.box('profile');
  String url = GlobalConfiguration().get('url');

  Future<CivilianLogsModel> civilianLogs() {
    return http.get(Uri.parse(url + 'logs_civilians'), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${_profileBox.get('access_token')}',
      HttpHeaders.acceptHeader: 'application/json',
    }).then((res) {
      return CivilianLogsModel.fromJson(json.decode(res.body));
    });
  }

  Future<EstablishmentLogsModel> establishmentsLogs() {
    return http.get(Uri.parse(url + 'logs_establishments'), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${_profileBox.get('access_token')}',
      HttpHeaders.acceptHeader: 'application/json',
    }).then((res) {
      return EstablishmentLogsModel.fromJson(json.decode(res.body));
    });
  }

  Future<VehicleLogsModel> getVehicleLogs() {
    return http.get(Uri.parse(url + 'logs_vehicles'), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${_profileBox.get('access_token')}',
      HttpHeaders.acceptHeader: 'application/json',
    }).then((res) {
      return VehicleLogsModel.fromJson(json.decode(res.body));
    });
  }
}
