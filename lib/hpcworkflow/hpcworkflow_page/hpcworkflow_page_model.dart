import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/hpcworkflow/component/end_component/end_component_widget.dart';
import '/hpcworkflow/component/init_component/init_component_widget.dart';
import '/hpcworkflow/component/key_finish_component/key_finish_component_widget.dart';
import '/hpcworkflow/component/keyinfo_component/keyinfo_component_widget.dart';
import '/hpcworkflow/component/strat_component/strat_component_widget.dart';
import 'hpcworkflow_page_widget.dart' show HpcworkflowPageWidget;
import 'package:flutter/material.dart';

class HpcworkflowPageModel extends FlutterFlowModel<HpcworkflowPageWidget> {
  ///  Local state fields for this page.

  double? totalCount;

  double? doneCount;

  double? noneCount;

  String? patid = '0';

  String? inspecdate = '0';

  bool? visibleFlag = false;

  int? timerLimit = 0;

  int processFlag = 0;

  String? encryptedChartnumber;

  String? qstr;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (decryptParmUsingPOST)] action in hpcworkflowPage widget.
  ApiCallResponse? decryptParm;
  InstantTimer? instantTimer1;
  // Stores action output result for [Backend Call - API (getHpcWorkFlowUsingPOST)] action in hpcworkflowPage widget.
  ApiCallResponse? processFlagOutput;
  // Stores action output result for [Backend Call - API (getRegistrationUsingPOST)] action in hpcworkflowPage widget.
  ApiCallResponse? registrationResult;
  // Stores action output result for [Backend Call - API (getWaitListUsingPOST)] action in hpcworkflowPage widget.
  ApiCallResponse? waitlistResult;
  // Model for initComponent component.
  late InitComponentModel initComponentModel;
  // Model for StratComponent component.
  late StratComponentModel stratComponentModel;
  // Model for keyinfoComponent component.
  late KeyinfoComponentModel keyinfoComponentModel;
  // Model for keyFinishComponent component.
  late KeyFinishComponentModel keyFinishComponentModel;
  // Model for endComponent component.
  late EndComponentModel endComponentModel;

  @override
  void initState(BuildContext context) {
    initComponentModel = createModel(context, () => InitComponentModel());
    stratComponentModel = createModel(context, () => StratComponentModel());
    keyinfoComponentModel = createModel(context, () => KeyinfoComponentModel());
    keyFinishComponentModel =
        createModel(context, () => KeyFinishComponentModel());
    endComponentModel = createModel(context, () => EndComponentModel());
  }

  @override
  void dispose() {
    instantTimer1?.cancel();
    initComponentModel.dispose();
    stratComponentModel.dispose();
    keyinfoComponentModel.dispose();
    keyFinishComponentModel.dispose();
    endComponentModel.dispose();
  }
}
