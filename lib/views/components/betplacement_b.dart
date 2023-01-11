import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/appbar.dart';

class PannaBet extends StatefulWidget {
  const PannaBet({super.key, required this.matchId});
  final String matchId;

  @override
  State<PannaBet> createState() => _PannaBetState();
}

class _PannaBetState extends State<PannaBet> {
  final HomeController _mainController = Get.find();
  List<BidsModal> bidsModal = [];
  TextEditingController bidText = TextEditingController();
  TextEditingController amountText = TextEditingController();
  var bidCount = 0;

  @override
  void initState() {
    Constant.box.write('matchId', widget.matchId);
    Constant.box.write('betType', 'SinglePanna');
    super.initState();
  }

  @override
  void dispose() {
    bidText.dispose();
    amountText.dispose();
    Constant.box.remove('bidNum');
    super.dispose();
  }

  void addBid(String bidVal, String? amount) {
    final index = bidsModal.indexWhere((element) => element.bidNum == bidVal);
    if (index >= 0) {
      Get.snackbar('Alert', 'Already added',
          duration: const Duration(seconds: 1),
          shouldIconPulse: true,
          backgroundColor: Colors.amber);
    } else {
      bidsModal.add(BidsModal(bidNum: bidVal, bidAmnt: amount));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: TopAppBar(istate: 0),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'GAME TITLE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Text(
                    'BET END TIME',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(0, 31, 36, 1),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'ENTER BID NUMBERS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 273,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff00161A),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-4, 4),
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.8),
                                  inset: true,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              child: TextFormField(
                                controller: bidText,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    height: 1.0,
                                    color: Colors.amber),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'XXX',
                                ),
                                keyboardType: TextInputType.number,
                                /* onChanged: (value) => , */
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
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(0, 31, 36, 1),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'ENTER AMOUNT (Rs.)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 273,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff00161A),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-4, 4),
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.8),
                                  inset: true,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              child: TextFormField(
                                controller: amountText,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    height: 1.0,
                                    color: Colors.amber),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '0',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  GestureDetector(
                    onTap: (() {
                      var bidNum = bidText.text;
                      var biDAmnt = amountText.text;
                      if (bidNum == '' || bidNum.length != 3) {
                        Get.snackbar('Alert', 'Select your number!');
                      } else if (bidNum != '' && biDAmnt != '') {
                        setState(() {
                          _mainController.addBid(bidNum, biDAmnt);
                        });
                      } else {
                        Get.snackbar('Alert', 'Invalid amount');
                      }
                    }),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      width: 200,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(225, 221, 0, 1),
                              Color.fromRGBO(168, 146, 0, 1)
                            ]),
                      ),
                      child: const Text(
                        'ADD BID IN LIST',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    color: bottomBarBg,
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            color: Colors.brown,
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text('Bid Number'),
                                Text('Bid Points'),
                                Text('Action'),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _mainController.bids.length,
                            itemBuilder: ((context, index) {
                              var bidData = _mainController.bids[index];
                              return Container(
                                height: 58,
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.lightBlue.shade900),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(bidData.bidNum!)),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(bidData.bidAmnt!)),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: IconButton(
                                          onPressed: (() => _mainController
                                              .removeBids(index)),
                                          iconSize: 18,
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  GestureDetector(
                    onTap: (() {
                      if (Constant.box.read('matchId') != '') {
                        _mainController.formSubmit();
                      } else {
                        Get.snackbar('Alert', 'Select the Game first',
                            duration: const Duration(seconds: 1),
                            shouldIconPulse: true,
                            backgroundColor: Colors.amber);
                      }
                    }),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      width: 200,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(225, 221, 0, 1),
                              Color.fromRGBO(168, 146, 0, 1)
                            ]),
                      ),
                      child: const Text(
                        'PLACE BID NOW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
