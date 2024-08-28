import 'package:dio/src/response.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/remote/infra/api_constants.dart';
import 'package:mobile_recharge_app/data/remote/infra/http_infra.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  Future<Response> getBeneficiaries() {
    return AppDio.instance.dio.request(ApiConstants.getBeneficiaries);
  }

  Future<Response> createBeneficiaries(ModelBeneficiary ben) {
    return AppDio.instance.dio
        .post(ApiConstants.getCreateBeneficiaries, data: ben.toJson());
  }
}
