import 'package:flutter/material.dart';

class BalanceTabView extends StatefulWidget {
  const BalanceTabView({required Key key}) : super(key: key);

  @override
  State<BalanceTabView> createState() => _BalanceTabViewState();
}

class _BalanceTabViewState extends State<BalanceTabView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Balance tab view'),
      ),
    );
  }
}
