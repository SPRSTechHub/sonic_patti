import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/utils/constants.dart';

class AllBids extends StatefulWidget {
  const AllBids({super.key});

  @override
  State<AllBids> createState() => _AllBidsState();
}

class _AllBidsState extends State<AllBids> {
  List<BidsList> bidsList = [];
  int? sortColumnIndex;
  bool isAscending = false;

  final HomeController bidController = Get.find<HomeController>();
  @override
  void initState() {
    setState(() {
      bidController.fetchPlaceBids(
          '',
          Constant.box.read('mobile') ?? '0123456789',
          'date',
          'desc',
          '50',
          '0',
          '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: appBarBg,
              child: Column(
                children: [
                  const Text('BET HISTORY'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('data'),
                      GestureDetector(
                        onTap: (() {
                          showBids();
                        }),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 2.0),
                          width: 120,
                          height: 30,
                          padding: const EdgeInsets.all(2.0),
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
                            'REFRESH',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                color: bottomBarBg,
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: buildDataTable()),
          ],
        ),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = ['Date', 'Time', 'Matches', 'Bidtype', 'Amnt'];
    return Obx(
      () => DataTable(
          border: TableBorder.all(width: 0.5, color: Colors.white60),
          columnSpacing: Get.width * .02,
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(bidController.bidsList)),
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

  List<DataRow> getRows(List<BidsList> bidsList) =>
      bidsList.map((BidsList bidsList) {
        final cells = [
          /* 'D${bidsList.date}\nT${bidsList.time}', */
          bidsList.date,
          bidsList.time,
          bidsList.game,
          bidsList.patti,
          bidsList.amount
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
      bidController.bidsList
          .sort(((a, b) => compareString(ascending, a.date, b.date)));
    } else if (columnIndex == 1) {
      bidController.bidsList
          .sort(((a, b) => compareString(ascending, a.time, b.time)));
    } else if (columnIndex == 2) {
      bidController.bidsList
          .sort(((a, b) => compareString(ascending, a.game, b.game)));
    } else if (columnIndex == 3) {
      bidController.bidsList
          .sort(((a, b) => compareString(ascending, a.patti, b.patti)));
    } else if (columnIndex == 4) {
      bidController.bidsList
          .sort(((a, b) => compareString(ascending, a.amount, b.amount)));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String v1, String v2) =>
      ascending ? v1.compareTo(v2) : v2.compareTo(v1);

  void showBids() {
    bidController.fetchPlaceBids(
        '',
        Constant.box.read('mobile') ?? '0123456789',
        'date',
        'desc',
        '50',
        '0',
        '');
  }
}
