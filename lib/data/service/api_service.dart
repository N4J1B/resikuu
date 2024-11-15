import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/apiKey.dart';
import '../../utils/constants.dart';
import '../model/custom_exception.dart';
import '../model/failure_model.dart';
import '../model/ongkir.dart';
import '../model/ongkir2.dart';
import '../model/resi.dart';
import '../model/city.dart';

class ApiService extends GetxService {
  final Dio _dio;
  ApiService({required Dio dio}) : _dio = dio;

  Future<Resi> getResi(String courier, String awb) async {
    final finalUrl = '$url1/track?api_key=$apiKey1&courier=$courier&awb=$awb';

    try {
      final response = await _dio.get(finalUrl);
      if (response.statusCode == 200) {
        return Resi.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.data.message));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(
          e.response?.statusCode,
          e.response?.data["message"] ??
              e.response?.statusMessage ??
              e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<Ongkir> getOngkir(
      String origin, String destination, int weight, String volume) async {
    final finalUrl =
        '$url1/cost?api_key=$apiKey1&courier=jne,sicepat,anteraja,lion,sap,pos,ide&origin=$origin&destination=$destination&weight=$weight&volume=$volume';

    try {
      final response = await _dio.get(finalUrl);
      if (response.statusCode == 200) {
        return Ongkir.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.data.message));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(
          e.response?.statusCode,
          e.response?.data["message"] ??
              e.response?.statusMessage ??
              e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<Ongkir2> getOngkir2(
      String origin, String destination, int weight) async {
    const finalUrl = "$url2/v1/rates/couriers";
    try {
      final response = await _dio.post(finalUrl,
          data: {
            "origin_area_id": origin,
            "destination_area_id": destination,
            "couriers":
                "gojek,grab,deliveree,jne,tiki,ninja,lion,sicepat,jnt,idexpress,rpx,wahana,pos,anteraja,sap,paxel",
            "items": [
              {
                "name": "Request",
                "value": 10000,
                "weight": weight,
                "quantity": 1,
              }
            ]
          },
          options: Options(
            headers: {"authorization": apiKey2},
          ));
      if (response.statusCode == 200) {
        return Ongkir2.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.data.error));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(
          e.response?.statusCode,
          e.response?.data["message"] ??
              e.response?.statusMessage ??
              e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<City> getCity(String input) async {
    final finalUrl =
        '$url2/v1/maps/areas?countries=ID&input=$input&type=single';

    try {
      final response = await _dio.get(finalUrl,
          options: Options(
            headers: {"authorization": apiKey2},
          ));
      if (response.statusCode == 200) {
        return City.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.data.message));
      }
    } on DioException catch (e) {
      throw CustomException(
        FailureModel(
          e.response?.statusCode,
          e.response?.data["message"] ?? e.response?.statusMessage ?? e.message,
        ),
      );
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }
}
