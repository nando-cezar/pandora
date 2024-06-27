import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_procedure.dart';

class MyBottomSheet extends StatelessWidget {
  final Map<String, dynamic> metaData;
  final List<String> dataSource;

  const MyBottomSheet(
      {super.key, required this.metaData, required this.dataSource});

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
                  image: AssetImage(metaData['image']),
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
                        '${dataSource.first} - ${metaData['uid']}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'extreme_event_type:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        metaData['type'].toString().tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    'address:'.tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    metaData['address'],
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'state:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        metaData['state'],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'region:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        metaData['region'].toString().tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Row(
                    children: [
                      Text(
                        'occurrence_interval:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${metaData['startDate']} ~ ${metaData['endDate']}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'total_deaths:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        metaData['totalDeath'].toString(),
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'total_affected:'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        metaData['totalAffected'].toString(),
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'procedure'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  MyProcedure(
                    title: 'Cold wave'.tr,
                    procedures: [
                      'procedure1'.tr,
                      'procedure2'.tr,
                      'procedure3'.tr,
                      'procedure4'.tr,
                      'procedure5'.tr,
                    ],
                  ),
                  MyProcedure(
                    title: 'Flood'.tr,
                    procedures: [
                      'procedure6'.tr,
                      'procedure7'.tr,
                      'procedure8'.tr,
                      'procedure9'.tr,
                      'procedure10'.tr,
                    ],
                  ),
                  MyProcedure(
                    title: 'Storm, General'.tr,
                    procedures: [
                      'procedure11'.tr,
                      'procedure12'.tr,
                      'procedure13'.tr,
                      'procedure14'.tr,
                      'procedure15'.tr,
                    ],
                  ),
                  MyProcedure(
                    title: 'Heat wave'.tr,
                    procedures: [
                      'procedure16'.tr,
                      'procedure17'.tr,
                      'procedure18'.tr,
                      'procedure19'.tr,
                      'procedure20'.tr,
                    ],
                  ),
                  MyProcedure(
                    title: 'Tropical cyclone'.tr,
                    procedures: [
                      'procedure21'.tr,
                      'procedure22'.tr,
                      'procedure23'.tr,
                      'procedure24'.tr,
                      'procedure25'.tr,
                    ],
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
