import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'uuh_hpc_work_flow_page_widget.dart' show UuhHpcWorkFlowPageWidget;
import 'package:flutter/material.dart';

class UuhHpcWorkFlowPageModel
    extends FlutterFlowModel<UuhHpcWorkFlowPageWidget> {
  ///  Local state fields for this page.

  String? patid;

  String? inspecdate;

  String? encryptedChartnumber;

  String? qstr;

  String? process;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (decryptParmUsingPOST)] action in uuhHpcWorkFlowPage widget.
  ApiCallResponse? decryptParm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
