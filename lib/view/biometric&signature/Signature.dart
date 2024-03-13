import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'dart:typed_data';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  Uint8List? exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellowAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Signature Pad Example"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Signature(
              controller: controller,
              width: 350,
              height: 200,
              backgroundColor: Colors.lightBlue[100]!,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          exportedImage = await controller.toPngBytes();
                          //API
                          setState(() {});
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))))),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.clear();
                        },
                        child: const Text(
                          "Clear",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (exportedImage != null)
              Image.memory(
                exportedImage!,
                width: 300,
                height: 250,
              )
          ],
        ),
      ),
    );
  }
}
