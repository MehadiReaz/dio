import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(2, 0), // changes position of shadow
              ),
            ],
          ),
          child: const Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Start Time'),
                      Text(
                        '9:00pm',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('End Time'),
                      Text(
                        '7:00pm',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Break Time'),
                      Text(
                        '1:30pm',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )),
            ],
          ));
  }
}
