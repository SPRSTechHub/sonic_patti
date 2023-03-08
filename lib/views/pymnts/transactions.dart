import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/pymnt_controller.dart';
import 'package:sonicpattilive/models/transactions.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/components/appbar.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<TransactionsClass> transactionList = [];
  int? sortColumnIndex;
  bool isAscending = false;
  String mobile = Constant.box.read('mobile') ?? '0123456789';
  final PaymentController _paymentController = Get.find<PaymentController>();
  @override
  void initState() {
    setState(() {
      _paymentController.fetchTransactionDetails(
          mobile, 'id', 'desc', '50', '0');
    });
    super.initState();
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
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Text(
                          'MY TRANSACTIONS',
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _paymentController.fetchTransactionDetails(
                                Constant.box.read('mobile') ?? '0123456789',
                                'id',
                                'desc',
                                '50',
                                '0');
                          });
                        },
                        child: Container(
                          width: 92,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.45),
                                  offset: Offset(0, 3),
                                  blurRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xffE3E1D5).withOpacity(0.6),
                                  const Color(0xff9AF0FF),
                                ]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  'Reload',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                              ),
                              Icon(
                                Icons.refresh_outlined,
                                color: Color(0xff3F00FD),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 1.0,
                                      offset: Offset.zero)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(
                                  255, 255, 255, 0.17000000178813934),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                width: 0.5,
                              ),
                            )),
                      ),
                      Container(
                        width: 102,
                        height: 36,
                        padding: const EdgeInsets.all(8.0),
                        decoration: AppStyles.buttonBg,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Center(
                              child: Text(
                                'Search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                            Icon(
                              Icons.search_off_outlined,
                              color: Color(0xff3F00FD),
                              shadows: <Shadow>[
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                    offset: Offset.zero)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 102,
                          height: 36,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.45),
                                  offset: Offset(0, 3),
                                  blurRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xffE3E1D5).withOpacity(0.6),
                                  const Color(0xff9AF0FF),
                                ]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xff3F00FD),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 1.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              Center(
                                child: Text(
                                  'Prev',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Container(
                        width: 102,
                        height: 36,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.45),
                                offset: Offset(0, 3),
                                blurRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xffE3E1D5).withOpacity(0.6),
                                const Color(0xff9AF0FF),
                              ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Center(
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff3F00FD),
                              shadows: <Shadow>[
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                    offset: Offset.zero)
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                color: Theme.of(context).colorScheme.background,
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: transDataTable()),
          ],
        ),
      ),
    );
  }

  Widget transDataTable() {
    final columns = ['Date', 'Desc', 'Amount', 'Type', 'Ref'];
    return Obx(
      () => DataTable(
          border: TableBorder.all(width: 0.5, color: Colors.white60),
          columnSpacing: Get.width * .02,
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(_paymentController.transactionsList)),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<TransactionsClass> transactionList) =>
      transactionList.map((TransactionsClass bidsList) {
        final cells = [
          /* 'D${bidsList.date}\nT${bidsList.time}', */
          bidsList.date,
          bidsList.descp,
          bidsList.trAmnt,
          bidsList.trType,
          bidsList.trNo
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(Text(
            '$data',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10.5),
          )))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      _paymentController.transactionsList
          .sort(((a, b) => compareString(ascending, a.date, b.date)));
    } else if (columnIndex == 1) {
      _paymentController.transactionsList.sort((a, b) =>
          compareString(ascending, a.descp.toString(), b.descp.toString()));
    } else if (columnIndex == 2) {
      _paymentController.transactionsList
          .sort(((a, b) => compareString(ascending, a.trAmnt, b.trAmnt)));
    } else if (columnIndex == 3) {
      _paymentController.transactionsList
          .sort(((a, b) => compareString(ascending, a.trType, b.trType)));
    } else if (columnIndex == 4) {
      _paymentController.transactionsList
          .sort(((a, b) => compareString(ascending, a.trNo, b.trNo)));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String v1, String v2) =>
      ascending ? v1.compareTo(v2) : v2.compareTo(v1);
}
