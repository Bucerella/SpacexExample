import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex/utils/constants.dart';

class ContainerWidget extends StatelessWidget {
  final String? name;
  final String? details;
  final String? patch;
  final String? flightNumber;
  final String? dateLocal;

  const ContainerWidget({
    Key? key,
    this.patch,
    this.details,
    this.name,
    this.flightNumber,
    this.dateLocal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: primary, width: 5),
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            genericTextField(name!, headerStyle),
            genericTextField('Flight number: ${flightNumber!}', style1),
            genericTextField(details!, style1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(patch!),
            ),
            genericTextField(
              'Local date: ${DateFormat("dd/MM/yyyy hh:mm").format(DateTime.parse(dateLocal!))}',
              style1,
            ),
          ],
        ),
      ),
    );
  }
}

Widget genericTextField(String detail, TextStyle txtStyle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(detail, style: txtStyle),
  );
}
