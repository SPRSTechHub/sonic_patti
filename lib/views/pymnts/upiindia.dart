import 'package:flutter/material.dart';

class AllUpi extends StatefulWidget {
  AllUpi(
      {super.key,
      required this.receiverUpiId,
      required this.receiverName,
      required this.transactionRefId,
      required this.transactionNote,
      required this.amount});
  String receiverUpiId;
  String receiverName;
  String transactionRefId;
  String transactionNote;
  double amount;

  @override
  State<AllUpi> createState() => _AllUpiState();
}

class _AllUpiState extends State<AllUpi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
