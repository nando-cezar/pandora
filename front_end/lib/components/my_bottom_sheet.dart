import 'package:flutter/material.dart';

import '../constants.dart';

class MyBottomSheet extends StatefulWidget {
  final Map<String, dynamic> metaData;

  const MyBottomSheet({super.key, required this.metaData});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.metaData['image']),
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'EM-DAT - 2000-0019-BRA',
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Extreme event type:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.metaData['type'],
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Text(
                    'Address:',
                    style: TextStyle(
                      color: myTenthColor,
                    ),
                  ),
                  Text(
                    widget.metaData['address'],
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: myTenthColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'State:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Bahia',
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Region:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'North',
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    children: [
                      Text(
                        'Start date:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '25-05-1997',
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 20),
                      Text(
                        'End date:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '30-03-2024',
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Total Deaths:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '100.000',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 20),
                      Text(
                        'Total Affected:',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '70.000',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: myTenthColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
