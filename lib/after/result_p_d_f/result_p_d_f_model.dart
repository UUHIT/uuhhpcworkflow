import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'result_p_d_f_widget.dart' show ResultPDFWidget;
import 'package:flutter/material.dart';

class ResultPDFModel extends FlutterFlowModel<ResultPDFWidget> {
  ///  Local state fields for this page.

  bool loadComplete = false;

  bool? error = false;

  String? pdfFilename;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getResultPdfUsingPOST)] action in resultPDF widget.
  ApiCallResponse? apiGetResultPdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
