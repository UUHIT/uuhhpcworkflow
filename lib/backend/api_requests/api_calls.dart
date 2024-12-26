import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HHIARTS Documentation Group Code

class HHIARTSDocumentationGroup {
  static String getBaseUrl() => 'https://pmobile.uuh.ulsan.kr:8888';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetInspectableUsingPOSTCall getInspectableUsingPOSTCall =
      GetInspectableUsingPOSTCall();
  static GetPatientBasisUsingPOSTCall getPatientBasisUsingPOSTCall =
      GetPatientBasisUsingPOSTCall();
  static GetRegistrationUsingPOSTCall getRegistrationUsingPOSTCall =
      GetRegistrationUsingPOSTCall();
  static GetResultListUsingPOSTCall getResultListUsingPOSTCall =
      GetResultListUsingPOSTCall();
  static GetWaitListUsingPOSTCall getWaitListUsingPOSTCall =
      GetWaitListUsingPOSTCall();
  static InsertStatusUsingGETCall insertStatusUsingGETCall =
      InsertStatusUsingGETCall();
  static GetHpcWorkFlowUsingPOSTCall getHpcWorkFlowUsingPOSTCall =
      GetHpcWorkFlowUsingPOSTCall();
  static DecryptParmUsingPOSTCall decryptParmUsingPOSTCall =
      DecryptParmUsingPOSTCall();
  static GetWaitListDetailUsingPOSTCall getWaitListDetailUsingPOSTCall =
      GetWaitListDetailUsingPOSTCall();
  static GetRegistrationListUsingPOSTCall getRegistrationListUsingPOSTCall =
      GetRegistrationListUsingPOSTCall();
  static GetAfterScheduleUsingPOSTCall getAfterScheduleUsingPOSTCall =
      GetAfterScheduleUsingPOSTCall();
  static GetResultPdfUsingPOSTCall getResultPdfUsingPOSTCall =
      GetResultPdfUsingPOSTCall();
  static GetBeforeNoticeInfoUsingPOSTCall getBeforeNoticeInfoUsingPOSTCall =
      GetBeforeNoticeInfoUsingPOSTCall();
  static GetAfterNoticeInfoUsingPOSTCall getAfterNoticeInfoUsingPOSTCall =
      GetAfterNoticeInfoUsingPOSTCall();
  static GetEncryptedChartnumberCall getEncryptedChartnumberCall =
      GetEncryptedChartnumberCall();
  static GetDisreqExistUsingPOSTCall getDisreqExistUsingPOSTCall =
      GetDisreqExistUsingPOSTCall();
  static InsertDisreqUsingPOSTCall insertDisreqUsingPOSTCall =
      InsertDisreqUsingPOSTCall();
}

class GetInspectableUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? inspectableInputDTO = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getInspectableUsingPOST',
      apiUrl: '$baseUrl/api/getInspectable',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPatientBasisUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patientBasisInputDTO = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPatientBasisUsingPOST',
      apiUrl: '$baseUrl/api/getPatientBasis',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRegistrationUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRegistrationUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getRegistration',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? registrationResult(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  String? chartnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.chartnumber''',
      ));
  String? inspecdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.inspecdate''',
      ));
  String? inspectime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.inspectime''',
      ));
  String? patname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.patname''',
      ));
  String? wtarea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.wtarea''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetResultListUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patientBasisInputDTO = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getResultListUsingPOST',
      apiUrl: '$baseUrl/api/getResultList',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWaitListUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWaitListUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getWaitList',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? waitlistResult(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  List? waitlistArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? wroomnum(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wroomnum''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? wrname(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wrname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? wtstatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wtstatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsertStatusUsingGETCall {
  Future<ApiCallResponse> call({
    String? processFlag = '',
    String? patId = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'insertStatusUsingGET',
      apiUrl: '$baseUrl/api/insertStatus',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'processFlag': processFlag,
        'patId': patId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHpcWorkFlowUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getHpcWorkFlowUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getHpcWorkFlow',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? processflag(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.processflag''',
      ));
}

class DecryptParmUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? qstr = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
$qstr''';
    return ApiManager.instance.makeApiCall(
      callName: 'decryptParmUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/decryptParm',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWaitListDetailUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? wrgroup = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "wrgroup": "$wrgroup",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWaitListDetailUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getWaitListDetail',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? waitListDetailDTO(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? headcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].headcode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? headname(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].headname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? wrgroup(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wrgroup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? wrname(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wrname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetRegistrationListUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRegistrationListUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getRegistrationList',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  List? registrationDTO(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAfterScheduleUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAfterScheduleUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getAfterSchedule',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetResultPdfUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? filename = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "$patid",
  "inspecdate": "$inspecdate",
  "filename": "$filename",
  "encryptedChartnumber": "$encryptedChartnumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getResultPdfUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getResultPdf',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? filename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.filename''',
      ));
}

class GetBeforeNoticeInfoUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "${escapeStringForJson(patid)}",
  "inspecdate": "${escapeStringForJson(inspecdate)}",
  "encryptedChartnumber": "${escapeStringForJson(encryptedChartnumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBeforeNoticeInfoUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getBeforeNoticeInfo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? chartnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.chartnumber''',
      ));
  String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  String? inspecdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.inspecdate''',
      ));
  String? ampm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.ampm''',
      ));
  String? standard(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.standard''',
      ));
  String? female(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.female''',
      ));
  String? foodnotice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.foodnotice''',
      ));
  String? sd5(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.sd5''',
      ));
  String? ct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.ct''',
      ));
  String? mr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.mr''',
      ));
  String? petct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.petct''',
      ));
  String? ma1ma5(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.ma1ma5''',
      ));
  String? sd3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.sd3''',
      ));
  String? caution(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.caution''',
      ));
}

class GetAfterNoticeInfoUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "${escapeStringForJson(patid)}",
  "inspecdate": "${escapeStringForJson(inspecdate)}",
  "encryptedChartnumber": "${escapeStringForJson(encryptedChartnumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAfterNoticeInfoUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getAfterNoticeInfo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? chartnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.chartnumber''',
      ));
  String? inspecdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.inspecdate''',
      ));
  String? ampm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.ampm''',
      ));
  String? endostandard(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endostandard''',
      ));
  String? endoscope1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endoscope1''',
      ));
  String? endoscope2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endoscope2''',
      ));
  String? endoscope3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endoscope3''',
      ));
  String? endoscope4(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endoscope4''',
      ));
  String? endoscope5(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endoscope5''',
      ));
  String? ct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.ct''',
      ));
  String? g18(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.g18''',
      ));
}

class GetEncryptedChartnumberCall {
  Future<ApiCallResponse> call({
    String? patid = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
$patid''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEncryptedChartnumber',
      apiUrl: '$baseUrl/uuhhpcapi/api/encryptChartnumber',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDisreqExistUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "${escapeStringForJson(patid)}",
  "inspecdate": "${escapeStringForJson(inspecdate)}",
  "encryptedChartnumber": "${escapeStringForJson(encryptedChartnumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDisreqExistUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/getDisreqExist',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? reqdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.reqdate''',
      ));
  int? reqseq(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.reqseq''',
      ));
  String? headcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.headcode''',
      ));
  String? headname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.headname''',
      ));
}

class InsertDisreqUsingPOSTCall {
  Future<ApiCallResponse> call({
    String? patid = '',
    String? inspecdate = '',
    String? encryptedChartnumber = '',
  }) async {
    final baseUrl = HHIARTSDocumentationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "patid": "${escapeStringForJson(patid)}",
  "inspecdate": "${escapeStringForJson(inspecdate)}",
  "encryptedChartnumber": "${escapeStringForJson(encryptedChartnumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertDisreqUsingPOST',
      apiUrl: '$baseUrl/uuhhpcapi/api/insertDisreq',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End HHIARTS Documentation Group Code

class ParkingStatusCall {
  static Future<ApiCallResponse> call({
    String? asParkStation = '',
  }) async {
    final ffApiRequestBody = '''
{
  "asParkStation": "$asParkStation"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ParkingStatus',
      apiUrl: 'https://pmobile.uuh.ulsan.kr:8888/daonpark/api/callflorslot',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'X-API-Key':
            '5D0F298B3ED73CC1D145F59E454157687CE0F3D8E89C8F29FCDA519B0DF54DCF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? parkingStatus(dynamic response) => getJsonField(
        response,
        r'''$.florSlotDTO''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
