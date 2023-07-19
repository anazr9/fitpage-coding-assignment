import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/widgets/detail_screen_heading.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ScanData data;
  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              // Setting the width and height of the container to be responsive to the device's screen size

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // DetailScreenHeading widget is used to display the heading section of the detail screen
                    // The data from the constructor is passed as a parameter to the DetailScreenHeading widget.
                    DetailScreenHeading(
                      data: data,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
