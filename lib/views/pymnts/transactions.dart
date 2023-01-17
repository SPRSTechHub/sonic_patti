import 'package:flutter/material.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/appbar.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: TopAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0XFF000000),
                      offset: Offset(0, 4),
                      blurRadius: 2)
                ],
                color: const Color(0xff011F23),
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
                          'TRANSACTION HISTORY',
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
                      Container(
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
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
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
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
