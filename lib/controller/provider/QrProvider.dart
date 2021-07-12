import 'package:app/model/CreateScanModel.dart';
import 'package:app/controller/provider/LogsProvider.dart';

import 'package:app/controller/services/ScanServices.dart';
import 'package:app/view/Home.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrProvider extends ChangeNotifier {
  final _services = ScanServices();
  bool _scanned = false;

  void onQRViewCreated({
    QRViewController? controller,
    required BuildContext context,
  }) {
    controller!.scannedDataStream.listen((scanData) async {
      _scanned = true;

      if (_scanned) {
        if (scanData.code.length > 0) {
          controller.pauseCamera();

          _scanned = false;

          String identifier = scanData.code[0];

          CreateScanModel res =
              await _services.scan(guid: scanData.code, identifier: identifier);

          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));

          if (!res.success!) {
            CoolAlert.show(
              backgroundColor: Colors.white,
              context: context,
              type: CoolAlertType.error,
              confirmBtnColor: Colors.red,
              text: 'Something went wrong!',
            );
          } else {
            CoolAlert.show(
              backgroundColor: Colors.white,
              context: context,
              type: CoolAlertType.success,
              confirmBtnColor: Theme.of(context).primaryColor,
              text: 'Scanned Successful',
            );
          }
        }
      }
    });
  }
}
