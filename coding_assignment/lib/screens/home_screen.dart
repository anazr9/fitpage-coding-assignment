import 'package:coding_assignment/repository/scan_repository.dart';
import 'package:coding_assignment/widgets/stock_scan_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ScanRepository repo;

  const HomeScreen({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Calling the getScanData method of ScanRepository to fetch ScanData.
        future: repo.getScanData(),
        builder: (context, asyn) {
          // If the Future has data (completed successfully), show the ScanData in the UI.
          if (asyn.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: asyn.data?.length,
                          itemBuilder: (context, index) =>
                              // The data for each StockScanTile is taken from the ScanData list.
                              StockScanTile(
                            data: asyn.data![index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (asyn.hasError) {
            // If the Future has an error, display an error message.
            return const Center(child: Text("Something went wrong"));
          } else {
            // If the Future is still loading, show a CircularProgressIndicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
