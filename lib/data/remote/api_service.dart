import 'package:dio/src/response.dart';
import 'package:mobile_recharge_app/data/remote/infra/api_constants.dart';
import 'package:mobile_recharge_app/data/remote/infra/http_infra.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  Future<Response> getBeneficiaries() {
    return AppDio.instance.dio.request(ApiConstants.getBeneficiaries);
  }
}
