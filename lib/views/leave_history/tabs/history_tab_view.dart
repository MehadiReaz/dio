import 'package:flutter/material.dart';

class HistoryTabView extends StatefulWidget {
  const HistoryTabView({required Key key}) : super(key: key);

  @override
  State<HistoryTabView> createState() => _HistoryTabViewState();
}

class _HistoryTabViewState extends State<HistoryTabView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History tab view'),
      ),
    );
  }
}
