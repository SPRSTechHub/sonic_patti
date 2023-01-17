import 'package:flutter/material.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/appbar.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
              width: 390,
              height: 340,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: Color(0xff113726),
              ),
              child: const BuildATMCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildATMCard extends StatelessWidget {
  const BuildATMCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        gradient: LinearGradient(
            begin: Alignment(0.8173059225082397, 0.1653572916984558),
            end: Alignment(-0.1653572916984558, 0.16886486113071442),
            colors: [
              Color.fromRGBO(255, 234, 0, 1),
              Color.fromRGBO(128, 118, 0, 1)
            ]),
      ),
      child: Container(
        width: 330,
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
          gradient: LinearGradient(
              begin: Alignment(0.8421556353569031, 0.160120889544487),
              end: Alignment(-0.160120889544487, 0.17399908602237701),
              colors: [
                Color.fromRGBO(55, 49, 0, 0.9800000190734863),
                Color.fromRGBO(32, 28, 0, 1),
              ]),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JHONS MIKE',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kAtmCardTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
