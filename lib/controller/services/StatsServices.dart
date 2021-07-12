import 'dart:convert';
import 'dart:io';

import 'package:app/model/OloStatsModel.dart';
import 'package:app/model/StatsModel.dart';
import 'package:app/model/WorldStatsModel.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  var _profileBox = Hive.box('profile');
  String url = GlobalConfiguration().get('url');

  Future<StatsModel> getStatsPh() async {
    return await http
        .get(Uri.parse(
            'https://api.apify.com/v2/key-value-stores/lFItbkoNDXKeSWBBA/records/LATEST?disableRedirect=true'))
        .then((res) {
      print(res.body);
      return StatsModel.fromJson(json.decode(res.body));
    });
  }

  Future<OloStatsModel> getStatsOlongapo() async {
    return await http.get(Uri.parse(url + 'stats'), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer ${_profileBox.get('access_token')}',
    }).then((res) {
      print(res.body);
      return OloStatsModel.fromJson(json.decode(res.body));
    });
  }

  Future<WordStatsModel> getStatsWorld() async {
    return await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/all?today'), headers: {
      HttpHeaders.acceptHeader: 'application/json',
    }).then((res) {
      print(res.body);
      return WordStatsModel.fromJson(json.decode(res.body));
    });
  }
}
