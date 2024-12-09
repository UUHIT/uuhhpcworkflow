import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'parking_status_page_widget.dart' show ParkingStatusPageWidget;
import 'package:flutter/material.dart';

class ParkingStatusPageModel extends FlutterFlowModel<ParkingStatusPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> parkingStatusJson = [];
  void addToParkingStatusJson(dynamic item) => parkingStatusJson.add(item);
  void removeFromParkingStatusJson(dynamic item) =>
      parkingStatusJson.remove(item);
  void removeAtIndexFromParkingStatusJson(int index) =>
      parkingStatusJson.removeAt(index);
  void insertAtIndexInParkingStatusJson(int index, dynamic item) =>
      parkingStatusJson.insert(index, item);
  void updateParkingStatusJsonAtIndex(int index, Function(dynamic) updateFn) =>
      parkingStatusJson[index] = updateFn(parkingStatusJson[index]);

  bool isLoading = true;

  String place = 'NEW';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future refreshStatus(BuildContext context) async {
    ApiCallResponse? apiStatusResult;

    if (choiceChipsValue == '신관주차장') {
      place = 'OLD';
    } else {
      place = 'NEW';
    }

    apiStatusResult = await ParkingStatusCall.call(
      asParkStation: place,
    );

    if ((apiStatusResult.succeeded ?? true)) {
      parkingStatusJson = ParkingStatusCall.parkingStatus(
        (apiStatusResult.jsonBody ?? ''),
      )!
          .toList()
          .cast<dynamic>();
    }
  }
}
