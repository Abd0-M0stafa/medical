import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medical/core/errors/faliure.dart';
import 'package:medical/core/utils/app_strings.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage, super.repeat});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: AppStrings.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: AppStrings.serverSendTimeout);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: AppStrings.receiveTimeout);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );

      case DioExceptionType.connectionError:
        return ServerFailure(repeat: true, errMessage: AppStrings.noInternet);

      default:
        return ServerFailure(
          errMessage: AppStrings.sorrythereWasAnErrorPleaseTryAgain,
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic json) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        log(json.toString());

        return ServerFailure(
          errMessage: json['error'] != null
              ? (json['error']['ar'] ??
                    AppStrings.thereWasAnErrorPleaseTryAgain)
              : json.toString(),
        );

      case 404:
        return ServerFailure(errMessage: AppStrings.orderNotFound);

      case 408:
        return ServerFailure(errMessage: AppStrings.orderTimeOut);

      case 429:
        return ServerFailure(errMessage: AppStrings.numberOfOrdersIsBig);

      case 500:
        return ServerFailure(errMessage: AppStrings.internalServerError);

      case 502:
        return ServerFailure(errMessage: AppStrings.badGateway);

      case 503:
        return ServerFailure(errMessage: AppStrings.systemUnavailable);

      default:
        log(json.toString());
        return ServerFailure(errMessage: AppStrings.unexpectedError);
    }
  }
}
