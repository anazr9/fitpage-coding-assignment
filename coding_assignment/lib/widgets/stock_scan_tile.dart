import 'package:coding_assignment/config/routes/app_routes.dart';
import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/utils/utils.dart';
import 'package:flutter/material.dart';

class StockScanTile extends StatelessWidget {
  final ScanData data;
  const StockScanTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 8,
        ),
        ListTile(
          title: Text(
            data.name!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            data.tag!,
            style: TextStyle(
              color: data.subtitleColor,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.detailScreen,
                arguments: data);
          },
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 1),
          painter: DottedLinePainter(),
        ),
      ],
    );
  }
}
