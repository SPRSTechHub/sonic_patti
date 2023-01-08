import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/appbar.dart';
import 'package:sonic_patti/views/components/navigation.dart';

class SingleDigitBet extends StatefulWidget {
  const SingleDigitBet({super.key, required matchId});

  @override
  State<SingleDigitBet> createState() => _SingleDigitBetState();
}

class _SingleDigitBetState extends State<SingleDigitBet> {
  final HomeController _mainController = Get.find();
  //final _isVisible = true;
  //late final List<BidsModal> bidsModal = <BidsModal>[];
  List<BidsModal> bidsModal = [];
  TextEditingController amountText = TextEditingController();
  var bidCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountText.dispose();
    super.dispose();
  }

  void addBid(String bidVal, String? amount) {
    if (bidsModal.asMap().containsKey(bidVal)) {
      //
    } else {
      bidsModal.add(BidsModal(bidNum: bidVal, bidAmnt: amount));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  child: numberBox(),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  height: 59,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromRGBO(0, 31, 36, 1),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'ENTER AMOUNT',
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
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 353,
                          height: 273,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.amber,
                                offset: Offset.zero,
                                spreadRadius: 1.0,
                                blurRadius: 1.0,
                              ),
                            ],
                            color: const Color.fromRGBO(11, 39, 34, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: amountText,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Rs. 0',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Amount ?';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    var bidNum = GetStorage().read('bidNum');
                    var biDAmnt = amountText.text;
                    if (bidNum != '' && biDAmnt != '') {
                      setState(() {
                        addBid(bidNum, biDAmnt);
                      });
                    } else {
                      Get.snackbar('title', 'Empty!');
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
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  color: bottomBarBg,
                  child: Column(
                    children: bidsModal.map((personone) {
                      return Container(
                        child: Card(
                          child: ListTile(
                            title: Text(personone.bidNum.toString()),
                            subtitle: Text(personone.bidAmnt.toString()),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent),
                              child: const Icon(Icons.delete),
                              onPressed: () {
                                //delete action for this button
                                bidsModal.removeWhere((element) {
                                  return element.bidNum == personone.bidNum;
                                }); //go through the loop and match content to delete from list
                                setState(() {
                                  //refresh UI after deleting element from list
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
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
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: navBar(
          isElevated: true, isVisible: _mainController.isVisible.value ?? true),
    );
  }
}

final numbers = List.generate(10, (index) => '$index');
Widget numberBox() {
  return GridView.builder(
    padding: const EdgeInsets.all(8.0),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, mainAxisSpacing: 1, crossAxisSpacing: 1),
    itemCount: 10,
    itemBuilder: ((context, index) {
      final item = numbers[index];
      return buildNumbers(item);
    }),
  );
}

Widget buildNumbers(String number) => GestureDetector(
      onTap: (() {
        GetStorage().write('bidNum', number);
      }),
      child: Container(
        margin: const EdgeInsets.all(6.0),
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
          gradient: const LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(34, 72, 57, 1),
                Color.fromRGBO(0, 35, 40, 1)
              ]),
        ),
        child: Center(
          child: Text(
            number,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
      ),
    );
