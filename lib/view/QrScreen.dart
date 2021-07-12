import 'package:app/controller/provider/QrProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class QrScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QrScreenState();
  }
}

class QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController? _controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              cameraFacing: CameraFacing.back,
              key: qrKey,
              onQRViewCreated: (controller) {
                this._controller = controller;
                Provider.of<QrProvider>(context, listen: false)
                    .onQRViewCreated(controller: controller, context: context);
              },
              overlay: QrScannerOverlayShape(
                borderColor: Theme.of(context).primaryColor,
                borderRadius: 20,
                borderLength: 30,
                borderWidth: 1,
                cutOutSize: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  @override
  void dispose() {
    super.dispose();

    _controller!.dispose();
  }
}
