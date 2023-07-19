import 'package:coding_assignment/core/api_endpoint.dart';
import 'package:coding_assignment/models/stock_data_model.dart';
import 'package:coding_assignment/repository/scan_repository.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ScanRepository scanRepository;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    scanRepository = ScanRepository(client: dio);
  });

  test('getScanData returns a list of ScanData when the response is successful',
      () async {
    // Arrange
    final responseData = [
      {'id': 1, 'name': 'Scan 1'},
      {'id': 2, 'name': 'Scan 2'},
    ];
    dioAdapter.onGet(
      EndPoints.getScanDate,
      (request) => request.reply(200, responseData),
    );
    // Act
    final result = await scanRepository.getScanData();
    // Assert

    expect(result, isA<List<ScanData>>());
  });

  test('getScanData throws an Exception when the response is not successful',
      () async {
    // Arrange

    dioAdapter.onGet(
        EndPoints.getScanDate, (request) => request.reply(500, ''));
    // Act and Assert

    expect(() => scanRepository.getScanData(), throwsException);
  });
}
