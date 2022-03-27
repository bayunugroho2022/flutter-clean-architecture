// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'app_api.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps
//
// class _AppServicesClient implements AppServicesClient {
//   _AppServicesClient(this._dio, {this.baseUrl}) {
//     baseUrl ??= 'https://bayunugroho.mocklab.io';
//   }
//
//   // final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<ResponseLogin> login(email, password, imei, deviceType) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {
//       'email': email,
//       'password': password,
//       'imei': imei,
//       'device_type': deviceType
//     };
//
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<ResponseLogin>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, '/customer/login',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = ResponseLogin.fromJson(_result.data!);
//     print(value.toString() + " ssssss");
//     return value;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
