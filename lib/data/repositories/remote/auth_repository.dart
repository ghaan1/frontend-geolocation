import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend_geolocation/core/model/failure.dart';
import 'package:frontend_geolocation/core/service.dart';
import 'package:frontend_geolocation/model/auth/token_model.dart';
import 'package:frontend_geolocation/model/base_response.dart';
import 'package:frontend_geolocation/model/single_response.dart';

class AuthRepository {
  final dio = Service.app.dio;

  Future<Either<Failure, SingleResponse<TokenModel>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "/auth/login",
        data: {
          'username': email,
          'password': password,
        },
      );
      return Right(
        SingleResponse<TokenModel>.fromJson(
          response.data,
          (json) => TokenModel.fromJson(json),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        var errorResponse = BaseResponse.fromJson(e.response?.data);
        return Left(Failure(
          code: e.response?.statusCode,
          message: errorResponse.apiMessage,
        ));
      }
      return Left(Failure());
    }
  }
}
