import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/home_controller.dart';
import 'package:sonicpattilive/models/bids_modal.dart';
import 'package:sonicpattilive/utils/constants.dart';

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
                          'BIDS HISTORY',
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
                            bidController.fetchPlaceBids(
                                '',
                                Constant.box.read('mobile') ?? '0123456789',
                                'date',
                                'desc',
                                '50',
                                '0',
                                '');
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
