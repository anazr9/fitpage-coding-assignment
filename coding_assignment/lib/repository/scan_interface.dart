import 'package:coding_assignment/models/stock_data_model.dart';

// Abstract class IScanRepository defines the contract for a Scan Repository.
abstract class IScanRepository {
  // This method is responsible for fetching a list of ScanData objects.
  Future<List<ScanData>> getScanData();
}
