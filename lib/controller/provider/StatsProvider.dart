import 'package:app/model/OloStatsModel.dart';
import 'package:app/controller/services/StatsServices.dart';
import 'package:app/model/StatsModel.dart';
import 'package:app/model/WorldStatsModel.dart';
import 'package:flutter/foundation.dart';

class StatsProvider extends ChangeNotifier {
  final _services = StatsServices();
  StatsModel? statsPH;
  OloStatsModel? statsGapo;
  WordStatsModel? statsWorld;

  Future<void> getStatsPh() async {
    await _services.getStatsPh().then((res) {
      statsPH = res;
    });

    notifyListeners();
  }

  Future<void> getStatsOlongapo() async {
    await _services.getStatsOlongapo().then((res) {
      statsGapo = res;
    });

    notifyListeners();
  }

  Future<void> getStatsWorld() async {
    await _services.getStatsWorld().then((res) {
      statsWorld = res;
    });

    notifyListeners();
  }
}
