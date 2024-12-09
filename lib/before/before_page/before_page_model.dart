import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'before_page_widget.dart' show BeforePageWidget;
import 'package:flutter/material.dart';

class BeforePageModel extends FlutterFlowModel<BeforePageWidget> {
  ///  Local state fields for this page.

  String? patid;

  String? inspecdate;

  bool visibleFlag = false;

  String? encryptedChartnumber;

  String? qstr;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (decryptParmUsingPOST)] action in beforePage widget.
  ApiCallResponse? decryptParm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
