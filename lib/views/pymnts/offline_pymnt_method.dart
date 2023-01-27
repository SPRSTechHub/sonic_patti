import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sonic_patti/utils/constants.dart';

class OfflinePaymentMethod extends StatefulWidget {
  OfflinePaymentMethod({super.key, required this.amount});
  String? amount;
  @override
  State<OfflinePaymentMethod> createState() => _OfflinePaymentMethodsStat();
}

class _OfflinePaymentMethodsStat extends State<OfflinePaymentMethod> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: Get.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Offline Deposite'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'USE THIS QR TO PAY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 347,
                  height: 223,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      height: 160,
                      width: 160,
                      image: AssetImage("assets/images/pay_qr.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text(
                  '9768327053@ybl',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 351,
                  height: 148,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(217, 217, 217, 0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Userid: ${Constant.box.read('userid')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Text(
                            'Mobile: ${Constant.box.read('mobile')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Text(
                            'Amount Paid: ${widget.amount!}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              myAlert();
                            },
                            icon: const Icon(
                              Icons.upload_file_outlined,
                              color: Colors.green,
                            ),
                            label: Text(
                              'CLICK TO UPLOAD SCREENSHOT',
                              style: AppTextStyles.kLoginText
                                  .copyWith(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 90,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: image != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(image!.path),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: const Image(
                                  height: 130,
                                  width: 90,
                                  image: AssetImage("assets/images/pay_qr.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (image!.path == '') {
                      print(File(image!.path));
                    }
                  },
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.amber;
                        }
                        return Colors.red;
                      })),
                  icon: const Icon(
                    Icons.send_and_archive_outlined,
                    color: Colors.green,
                  ),
                  label: Text(
                    'CLICK TO SUBMIT',
                    style: AppTextStyles.kLoginText.copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: Get.width * .9,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(217, 217, 217, 0.25),
                  ),
                  child: const Text('Rules & Disclaimer'),
                ),
              ],
            ),
          ),
        ));
  }
}
