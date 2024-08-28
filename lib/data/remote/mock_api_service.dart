import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/remote/infra/api_constants.dart';
import 'package:mobile_recharge_app/data/remote/infra/http_infra.dart';

class MockApiService {
  static final MockApiService instance = MockApiService._internal();
  static DioAdapter? _dioAdaptor;

  AppDb db = AppDb.instance;

  MockApiService._internal();

  DioAdapter get mockApiService {
    if (_dioAdaptor != null) {
      return _dioAdaptor!;
    }

    _setupMockApiService();
    return _dioAdaptor!;
  }

  _setupMockApiService() {
    _dioAdaptor = DioAdapter(dio: AppDio.instance.dio);
    readAllBeneficiaries();
  }

  Future<void> readAllBeneficiaries() async {
    final list = await db.readAll();

    _dioAdaptor?.onGet(
      ApiConstants.getBeneficiaries,
      (server) => server.reply(
        200,
        ModelBeneficiary.convertListToJson(list),
        delay: const Duration(seconds: 5),
      ),
    );
  }
}
