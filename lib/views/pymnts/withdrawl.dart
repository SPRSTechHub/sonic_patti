import 'package:flutter/material.dart';
import 'package:sonic_patti/views/components/appbar.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: TopAppBar(istate: 0),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [Text('Withdrawl')]),
      ),
    );
  }
}
