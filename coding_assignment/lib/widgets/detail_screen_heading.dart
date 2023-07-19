import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:flutter/material.dart';

class DetailScreenHeading extends StatelessWidget {
  final ScanData data;
  const DetailScreenHeading({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.name!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(data.tag!, style: TextStyle(color: data.subtitleColor)),
          ],
        ),
      ),
    );
  }
}
