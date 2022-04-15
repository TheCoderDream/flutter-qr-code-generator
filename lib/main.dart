import 'package:flutter/material.dart';
import 'package:qr_code_generator/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrCodeGenerator(),
    )
  );
}

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: data,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
            ),
            const SizedBox(height: 24,),
            TextField(
              onChanged: (val) {
                setState(() {
                  data = val;
                });
              },
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white
              ),
              decoration: const InputDecoration(
                hintText: 'Type the data',
                filled: true,
                fillColor: AppStyle.textInputColor,
                border: InputBorder.none
              ),
            ),
            const SizedBox(height: 24,),
            RawMaterialButton(
              onPressed: () {},
              fillColor: AppStyle.accentColor,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 16.0
              ),
              child: const Text(
                'Generate QR Code'
              ),
            )
          ],
        ),
      ),
    );
  }
}
