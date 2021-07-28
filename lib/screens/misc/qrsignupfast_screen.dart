import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

class QrSignupFastScreen extends StatefulWidget {
  @override
  _QrSignupFastScreenState createState() => _QrSignupFastScreenState();
}

class _QrSignupFastScreenState extends State<QrSignupFastScreen> {
  List<CameraDescription> cameras;
  QRReaderController controller;
  bool isCamReady = false;

  @override
  void initState() {
    super.initState();
    _checkCamera();
  }

  Future<void> _checkCamera() async {
    cameras = await availableCameras();
    controller = new QRReaderController(
        cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value) {
      print(value); // the result!
      // ... do something
      // wait 3 seconds then start scanning again.
      new Future.delayed(const Duration(seconds: 3), controller.startScanning);
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCamReady = true;
      });
      controller.startScanning();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isCamReady) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new QRReaderPreview(controller));
  }
}
