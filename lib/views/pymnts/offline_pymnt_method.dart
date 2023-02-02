import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sonic_patti/controllers/pymnt_controller.dart';
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
  final PaymentController _paymentController = Get.find<PaymentController>();
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
          title: Text(
            'Offline Deposite',
            style: AppTextStyles.kAtmCardBalance.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  'USE THIS QR TO PAY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 200,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 330,
                          height: 55,
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Text(
                            '9768327053@ybl',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.kSubGameTitle.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 347,
                          height: 223,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 2),
                                  blurRadius: 4)
                            ],
                            color: Colors.white,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.background,
                              width: 4,
                            ),
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
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
                                letterSpacing: 0,
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
                                letterSpacing: 0,
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
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 4,
                          ),
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
                    final token = Constant.box.read('fcmToken') ?? false;
                    if (image != null && widget.amount != null) {
                      File? file = File(image!.path);
                      _paymentController.makePaymentOffline(
                          widget.amount, file.path, token);
                      setState(() {
                        imageCache.clear();
                        image = null;
                      });
                    } else {
                      const snackBar = SnackBar(
                        content: Text('No image selected! upload now'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
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
