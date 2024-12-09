import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'waitlist_detail_component_model.dart';
export 'waitlist_detail_component_model.dart';

class WaitlistDetailComponentWidget extends StatefulWidget {
  const WaitlistDetailComponentWidget({
    super.key,
    required this.patid,
    required this.inspecdate,
    required this.wrgroup,
    this.encryptedChartnumber,
  });

  final String? patid;
  final String? inspecdate;
  final String? wrgroup;
  final String? encryptedChartnumber;

  @override
  State<WaitlistDetailComponentWidget> createState() =>
      _WaitlistDetailComponentWidgetState();
}

class _WaitlistDetailComponentWidgetState
    extends State<WaitlistDetailComponentWidget> {
  late WaitlistDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitlistDetailComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.waitlistDetail =
          await HHIARTSDocumentationGroup.getWaitListDetailUsingPOSTCall.call(
        patid: widget.patid,
        inspecdate: widget.inspecdate,
        wrgroup: widget.wrgroup,
        encryptedChartnumber: widget.encryptedChartnumber,
      );

      if ((_model.waitlistDetail?.succeeded ?? true)) {
        _model.loadFinish = true;
        safeSetState(() {});
      } else {
        Navigator.pop(context);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.75,
        constraints: const BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFDBDBDB),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                if (_model.loadFinish) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).alternate,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'iv6c7yxq' /* 검사명 */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 10.0,
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: Color(0xFFD1D1D1),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final waitlistDetailItem = getJsonField(
                                        (_model.waitlistDetail?.jsonBody ?? ''),
                                        r'''$.data''',
                                      ).toList();

                                      return RefreshIndicator(
                                        key: const Key('RefreshIndicator_96tnwnnd'),
                                        onRefresh: () async {},
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: waitlistDetailItem.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 5.0),
                                          itemBuilder: (context,
                                              waitlistDetailItemIndex) {
                                            final waitlistDetailItemItem =
                                                waitlistDetailItem[
                                                    waitlistDetailItemIndex];
                                            return Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5.0),
                                                  bottomRight:
                                                      Radius.circular(5.0),
                                                  topLeft: Radius.circular(5.0),
                                                  topRight:
                                                      Radius.circular(5.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      flex: 7,
                                                      child: Text(
                                                        getJsonField(
                                                          waitlistDetailItemItem,
                                                          r'''$.headname''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'qlkw14q4' /* 닫기 */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text(
                    FFLocalizations.of(context).getText(
                      'wvv65fma' /* 로딩중... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
