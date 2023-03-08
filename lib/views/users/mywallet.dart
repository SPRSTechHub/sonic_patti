import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/controller_binding.dart';
import 'package:sonicpattilive/controllers/pymnt_controller.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/components/appbar.dart';
import 'package:sonicpattilive/views/components/cardatm.dart';
import 'package:sonicpattilive/views/pymnts/offline_pymnt_method.dart';
import 'package:sonicpattilive/views/pymnts/pymnt_methods.dart';
import 'package:sonicpattilive/views/pymnts/transactions.dart';
import 'package:sonicpattilive/views/pymnts/withdrawl.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final PaymentController _paymentController = Get.find<PaymentController>();
  late TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final amounCtltxt = TextEditingController();
  @override
  void initState() {
    _paymentController.fetchPmtMethod();
    super.initState();
  }

  @override
  void dispose() {
    amounCtltxt.dispose();
    super.dispose();
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              height: 340,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            'Hello, ${Constant.box.read('fullname') ?? 'Player'}',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.kAtmCardTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BuildATMCard(),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: GestureDetector(
                              onTap: () => Get.to(
                                const WithdrawScreen(),
                                transition: Transition.downToUp,
                                binding: ControllerBinding(),
                              ),
                              child: walletButtons(
                                  'Withdraw', Icons.outbond_outlined),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: GestureDetector(
                              onTap: () => Get.to(const TransactionsScreen(),
                                  binding: ControllerBinding(),
                                  transition: Transition.downToUp),
                              child: walletButtons(
                                  'Transfer', Icons.play_for_work_outlined),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            addMoney(),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  height: 180,
                  width: Get.width,
                  child: Obx(() {
                    if (_paymentController.isOfferProcessing.value == true) {
                      return GestureDetector(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      if (_paymentController.offerLists.isNotEmpty) {
                        return Container(
                          height: 180,
                          width: Get.width,
                          child: CarouselSlider.builder(
                            itemCount: _paymentController.offerLists.length,
                            itemBuilder: (BuildContext context, itemIndex,
                                    int pageViewIndex) =>
                                Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: FadeInImage(
                                  width: Get.width,
                                  filterQuality: FilterQuality.low,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(_paymentController
                                      .offerLists[itemIndex]!.offerLink),
                                  placeholder:
                                      AssetImage('assets/images/offer1.png'),
                                ),
                              ),
                            ),
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 1,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayCurve: Curves.fastOutSlowIn,
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Offers are loading ....'),
                          ],
                        );
                      }
                    }
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addMoney() {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: Get.width * .65,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(4),
                child: TextFormField(
                  controller: amounCtltxt,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'ENTER AMOUNT',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    filled: true,
                    fillColor: const Color(0x3CE0E3E7),
                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      color: Colors.blueGrey.shade100,
                    ),
                    suffixIcon: amounCtltxt.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => amounCtltxt.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFFFB0D0D),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: AppTextStyles.kAtmCardBalance.copyWith(fontSize: 20),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Amount!';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      var amount = int.parse(amounCtltxt.text);
                      var minDepo = Constant.box.read('minDepo') ?? 0;
                      if (amount >= int.parse(minDepo)) {
                        Get.to(OfflinePaymentMethod(amount: amount.toString()),
                            binding: ControllerBinding(),
                            transition: Transition.downToUp);
                      } else {
                        Get.snackbar(
                          'Alert',
                          'Minimum Deposite should be: $minDepo',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                        );
                      }
                    }
                  },
                  child: Container(
                    width: 158,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface),
                    child: Center(
                      child: Text(
                        'OFFLINE',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kYellowBtnTitle.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      var amount = int.parse(amounCtltxt.text);
                      var minDepo = Constant.box.read('minDepo') ?? 0;
                      if (amount >= int.parse(minDepo)) {
                        Get.to(PaymentMethods(amount: amount),
                            binding: ControllerBinding(),
                            transition: Transition.downToUp);
                      } else {
                        Get.snackbar(
                          'Alert',
                          'Minimum Deposite should be: $minDepo',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                        );
                      }
                    }
                  },
                  child: Container(
                    width: 158,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface),
                    child: Center(
                      child: Text(
                        'ONLINE',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kYellowBtnTitle.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 158,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface),
                    child: Center(
                      child: Text(
                        'REQUEST FRIEND',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kYellowBtnTitle.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 158,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface),
                    child: Center(
                      child: Text(
                        'REDEAM COINS',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kYellowBtnTitle.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  openMoneyModal(param) {
    return showModalBottomSheet(
        /*  isDismissible: false, */
        backgroundColor: bottomBarBg,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: Get.height * .6,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                    color: bottomBarHeader,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(flex: 2, child: Text('DEPOSITE AMOUNT')),
                      IconButton(
                        onPressed: (() => Get.back()),
                        icon: const Icon(
                          Icons.question_mark_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: (() => Get.back()),
                        icon: const Icon(
                          Icons.close_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text('data'),
                ),
              ],
            ),
          );
        });
  }

  walletButtons(String? btntext, IconData listOfIcons) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(4.0),
      decoration: AppStyles.buttonBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            listOfIcons,
            size: 28,
            color: const Color(0xff3F00FD),
            shadows: const <Shadow>[
              Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
            ],
          ),
          Center(
            child: Text(
              btntext!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
