import 'package:flutter/material.dart';

class OpenTable extends StatelessWidget {
  final String table;
  final bool occupied;
  const OpenTable({
    required this.table,
    required this.occupied,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(table),
            Text("$occupied"),
          ],
        ),
      ),
    );
  }
}
