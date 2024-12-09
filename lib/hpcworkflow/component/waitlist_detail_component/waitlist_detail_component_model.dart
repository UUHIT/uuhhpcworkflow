import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'waitlist_detail_component_widget.dart'
    show WaitlistDetailComponentWidget;
import 'package:flutter/material.dart';

class WaitlistDetailComponentModel
    extends FlutterFlowModel<WaitlistDetailComponentWidget> {
  ///  Local state fields for this component.

  bool loadFinish = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getWaitListDetailUsingPOST)] action in waitlistDetailComponent widget.
  ApiCallResponse? waitlistDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
