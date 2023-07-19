import 'package:coding_assignment/core/api_endpoint.dart';
import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/repository/scan_interface.dart';
import 'package:dio/dio.dart';

// The ScanRepository class implements the IScanRepository interface
// This means it provides an implementation for the `getScanData()` method.
class ScanRepository implements IScanRepository {
  final Dio client;
  ScanRepository({required this.client});
  // Implementation of the `getScanData()` method declared in IScanRepository.

  @override
  Future<List<ScanData>> getScanData() async {
    final response = await client.get(EndPoints.getScanDate);
    // Checking if the response status code is 200 (success).
    if (response.statusCode == 200) {
      //Parsing the data from the response into a list of ScanData objects.
      List<ScanData> data =
          (response.data as List).map((e) => ScanData.fromJson(e)).toList();

      return data;
    } else {
      // If the response is not successful (status code is not 200), throw an exception with an error message.
      throw Exception("Server Error");
    }
  }
}
