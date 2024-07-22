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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.zero,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDataRow(
                    context,
                    'extreme_event_type:'.tr,
                    metaData['type'].toString().tr,
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  _buildDataRow(context, 'address:'.tr, metaData['address']),
                  const SizedBox(height: 10),
                  _buildAddressRow(context, metaData),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  _buildDataRow(
                    context,
                    'occurrence_interval:'.tr,
                    '${metaData['startDate']} ~ ${metaData['endDate']}',
                  ),
                  const SizedBox(height: 10),
                  _buildDataRow(
                    context,
                    'total_deaths:'.tr,
                    metaData['totalDeath'].toString(),
                  ),
                  const SizedBox(height: 10),
                  _buildDataRow(
                    context,
                    'total_affected:'.tr,
                    metaData['totalAffected'].toString(),
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  _buildProcedureSection(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(BuildContext context, String label, String value) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(width: 5),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth - 70),
              child: Text(
                value,
                softWrap: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildAddressRow(BuildContext context, Map<String, dynamic> metaData) {
    return Row(
      children: [
        _buildDataRow(context, 'state:'.tr, metaData['state']),
        const Spacer(),
        _buildDataRow(context, 'region:'.tr, metaData['region'].toString().tr),
      ],
    );
  }

  Widget _buildProcedureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDataRow(
          Get.context!,
          'procedure'.tr,
          '',
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
      ],
    );
  }
}
