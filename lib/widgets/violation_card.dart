import 'package:evds_examinee/models/violation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViolationCard extends StatelessWidget {
  final Violation violation;
  final void Function()? onTap;

  const ViolationCard({
    Key? key,
    required this.violation,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: ListTile(
          title: Text(
            violation.evidence.examRoom.examRoomName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Created at: ${DateFormat("dd/MM/yyyy HH:mm").format(violation.createdDate)}",
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 28,
          ),
        ),
      ),
    );
  }
}
