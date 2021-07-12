import 'dart:convert';
import 'dart:io';

import 'package:app/model/CreateScanModel.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ScanServices {
  var _profileBox = Hive.box('profile');
  String url = GlobalConfiguration().get('url');

  Future<CreateScanModel> scan(
      {required String guid, required String identifier}) {
    String uri;

    switch (identifier) {
      case 'c':
        {
          uri = 'logs_civilians';
        }
        break;

      case 'v':
        {
          uri = 'logs_vehicles';
        }
        break;

      case 'e':
        {
          uri = 'logs_establishments';
        }
        break;

      default:
        {
          throw Exception('Something went wrong');
        }
    }

    return http.post(Uri.parse(url + uri), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${_profileBox.get('access_token')}',
      HttpHeaders.acceptHeader: 'application/json',
    }, body: {
      'host_id': guid,
    }).then(
      (res) {
        print('Res: ${res.body}');
        return CreateScanModel.fromJson(json.decode(res.body));
      },
    );
  }
}
