import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/utils/utils.dart';
import 'package:flutter/material.dart';

class DetailScreenBody extends StatelessWidget {
  final ScanData data;

  const DetailScreenBody({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.criteria?.length,
      itemBuilder: (context, index) {
        if (data.criteria?[index].text != null &&
            data.criteria![index].text!.contains('\$')) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: Utils.parseDollarText(
                    data.criteria![index].text!,
                    data.criteria![index].variable!,
                    context,
                  ),
                ),
              ),
              if (index >= 0 && index < data.criteria!.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "and",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          );
        }
        return Text(
          data.criteria?[index].text ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        );
      },
    );
  }
}
