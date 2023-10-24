import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final int index;
  final bool occupied;
  const TableCard({
    required this.index,
    required this.occupied,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Table $index',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'SofiaPro',
                ),
              ),
              Column(
                children: [
                  Container(),
                  Text(occupied == true ? 'Occupied' : 'Open'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
