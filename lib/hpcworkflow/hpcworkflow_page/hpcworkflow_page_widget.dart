import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/hpcworkflow/component/end_component/end_component_widget.dart';
import '/hpcworkflow/component/init_component/init_component_widget.dart';
import '/hpcworkflow/component/key_finish_component/key_finish_component_widget.dart';
import '/hpcworkflow/component/keyinfo_component/keyinfo_component_widget.dart';
import '/hpcworkflow/component/strat_component/strat_component_widget.dart';
import '/hpcworkflow/component/waitlist_detail_component/waitlist_detail_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'hpcworkflow_page_model.dart';
export 'hpcworkflow_page_model.dart';

class HpcworkflowPageWidget extends StatefulWidget {
  const HpcworkflowPageWidget({
    super.key,
    this.qstr,
  });

  final String? qstr;

  @override
  State<HpcworkflowPageWidget> createState() => _HpcworkflowPageWidgetState();
}

class _HpcworkflowPageWidgetState extends State<HpcworkflowPageWidget> {
  late HpcworkflowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HpcworkflowPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.qstr == null || widget.qstr == '') {
        _model.qstr = functions.getCurrentURL();
        safeSetState(() {});
      } else {
        _model.qstr = widget.qstr;
        safeSetState(() {});
      }

      _model.decryptParm =
          await HHIARTSDocumentationGroup.decryptParmUsingPOSTCall.call(
        qstr: _model.qstr,
      );

      _model.patid = getJsonField(
        (_model.decryptParm?.jsonBody ?? ''),
        r'''$.patid''',
      ).toString().toString();
      _model.inspecdate = getJsonField(
        (_model.decryptParm?.jsonBody ?? ''),
        r'''$.inspecdate''',
      ).toString().toString();
      _model.encryptedChartnumber = getJsonField(
        (_model.decryptParm?.jsonBody ?? ''),
        r'''$.encryptedChartnumber''',
      ).toString().toString();
      safeSetState(() {});
      _model.timerLimit = 0;
      safeSetState(() {});
      _model.instantTimer1 = InstantTimer.periodic(
        duration: const Duration(milliseconds: 30000),
        callback: (timer) async {
          _model.timerLimit = _model.timerLimit! + 1;
          safeSetState(() {});
          if (_model.timerLimit! > 30 ? true : false) {
            _model.instantTimer1?.cancel();
            return;
          }
          _model.processFlagOutput =
              await HHIARTSDocumentationGroup.getHpcWorkFlowUsingPOSTCall.call(
            patid: _model.patid,
            inspecdate: _model.inspecdate,
            encryptedChartnumber: _model.encryptedChartnumber,
          );

          if ((_model.processFlagOutput?.succeeded ?? true) == true) {
            _model.processFlag = valueOrDefault<int>(
              HHIARTSDocumentationGroup.getHpcWorkFlowUsingPOSTCall.processflag(
                (_model.processFlagOutput?.jsonBody ?? ''),
              ),
              0,
            );
            safeSetState(() {});
          } else {
            return;
          }

          _model.registrationResult =
              await HHIARTSDocumentationGroup.getRegistrationUsingPOSTCall.call(
            patid: _model.patid,
            inspecdate: _model.inspecdate,
            encryptedChartnumber: _model.encryptedChartnumber,
          );

          if (((_model.registrationResult?.succeeded ?? true) == true) &&
              (_model.processFlag > 0)) {
            _model.waitlistResult =
                await HHIARTSDocumentationGroup.getWaitListUsingPOSTCall.call(
              patid: _model.patid,
              inspecdate: _model.inspecdate,
              encryptedChartnumber: _model.encryptedChartnumber,
            );

            if ((_model.waitlistResult?.succeeded ?? true)) {
              _model.visibleFlag = true;
              safeSetState(() {});
              _model.totalCount = functions.waitlistCount(
                  getJsonField(
                    (_model.waitlistResult?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  'ALL');
              _model.doneCount = functions.waitlistCount(
                  getJsonField(
                    (_model.waitlistResult?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  'DONE');
              _model.noneCount = functions.waitlistCount(
                  getJsonField(
                    (_model.waitlistResult?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  'NONE');
              safeSetState(() {});
            } else {
              return;
            }
          } else {
            return;
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SizedBox(
              width: 450.0,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: SafeArea(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.95,
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (_model.processFlag == 1) {
                                    return wrapWithModel(
                                      model: _model.initComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InitComponentWidget(
                                        registrationJson: getJsonField(
                                          (_model.registrationResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        ),
                                      ),
                                    );
                                  } else if (_model.processFlag == 2) {
                                    return wrapWithModel(
                                      model: _model.stratComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StratComponentWidget(
                                        registrationJson: getJsonField(
                                          (_model.registrationResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        ),
                                      ),
                                    );
                                  } else if (_model.processFlag == 3) {
                                    return wrapWithModel(
                                      model: _model.keyinfoComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: KeyinfoComponentWidget(
                                        registrationJson: getJsonField(
                                          (_model.registrationResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        ),
                                      ),
                                    );
                                  } else if (_model.processFlag == 4) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                HHIARTSDocumentationGroup
                                                    .getRegistrationUsingPOSTCall
                                                    .patname(
                                                  (_model.registrationResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'nkxoi14c' /* 님  */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                HHIARTSDocumentationGroup
                                                    .getRegistrationUsingPOSTCall
                                                    .wtarea(
                                                  (_model.registrationResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gapgm0kb' /* 😊 */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ltpt2eyw' /*  검사현황 */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      elevation: 5.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .noneCount! >
                                                              0.0) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                functions.getFirstJson(getJsonField(
                                                                                  (_model.waitlistResult?.jsonBody ?? ''),
                                                                                  r'''$.data''',
                                                                                )),
                                                                                r'''$.wroomnum''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans',
                                                                                    color: Colors.white,
                                                                                    fontSize: 32.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w900,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                functions.getFirstJson(getJsonField(
                                                                                  (_model.waitlistResult?.jsonBody ?? ''),
                                                                                  r'''$.data''',
                                                                                )),
                                                                                r'''$.wrname''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans',
                                                                                    color: Colors.white,
                                                                                    fontSize: 26.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              100.0,
                                                                          child:
                                                                              VerticalDivider(
                                                                            thickness:
                                                                                2.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                getJsonField(
                                                                                  functions.getFirstJson(getJsonField(
                                                                                    (_model.waitlistResult?.jsonBody ?? ''),
                                                                                    r'''$.data''',
                                                                                  )),
                                                                                  r'''$.wtstatusname''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: Colors.white,
                                                                                      fontSize: 28.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () {
                                                                                  print('Button pressed ...');
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'vx5nftwb' /* 안내사항 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: const Color(0xFF333333),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Noto Sans',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: Color(
                                                                        0xFF05CB58),
                                                                    size: 100.0,
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hx3ycb8l' /* 검사가 모두 완료되었습니다. */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 0.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: const Color(0xFFEE7A42),
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  if (_model.totalCount! >
                                                      0.0) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 4,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '2tk73va5' /* 진행사항 */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 5,
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                _model.doneCount
                                                                    ?.toString(),
                                                                '0',
                                                              )}/${_model.totalCount?.toString()}✨',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    LinearPercentIndicator(
                                                                  percent:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (_model.doneCount!) /
                                                                        (_model
                                                                            .totalCount!),
                                                                    0.0,
                                                                  ),
                                                                  width: 100.0,
                                                                  lineHeight:
                                                                      14.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xDDFFFFFF),
                                                                  center: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3jxq5j7q' /* 
 */
                                                                      ,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                        ),
                                                                  ),
                                                                  barRadius: const Radius
                                                                      .circular(
                                                                          0.0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                (double var1,
                                                                        double
                                                                            var2) {
                                                                  return '${(var1 /
                                                                              var2 *
                                                                              100)
                                                                          .round()}%';
                                                                }(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .doneCount,
                                                                      0.0,
                                                                    ),
                                                                    _model
                                                                        .totalCount!),
                                                                '0%',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
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
                                                    );
                                                  } else {
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vi1funu6' /* 진행사항 없음 */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'eg3eep4p' /* 방번호 */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 7,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0c69hsob' /* 검사실 */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yzgzh9qq' /* 상태 */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'rcs00v03' /* 항목 */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
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
                                                          color:
                                                              Color(0xFFD1D1D1),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            if (_model
                                                                    .totalCount! >
                                                                0.0) {
                                                              return Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final waitListDTO =
                                                                        getJsonField(
                                                                      (_model.waitlistResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data''',
                                                                    ).toList();

                                                                    return RefreshIndicator(
                                                                      key: const Key(
                                                                          'RefreshIndicator_88wqndbv'),
                                                                      onRefresh:
                                                                          () async {},
                                                                      child: ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            waitListDTO.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(height: 5.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                waitListDTOIndex) {
                                                                          final waitListDTOItem =
                                                                              waitListDTO[waitListDTOIndex];
                                                                          return Container(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(5.0),
                                                                                bottomRight: Radius.circular(5.0),
                                                                                topLeft: Radius.circular(5.0),
                                                                                topRight: Radius.circular(5.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            waitListDTOItem,
                                                                                            r'''$.wroomnum''',
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 7,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          waitListDTOItem,
                                                                                          r'''$.wrname''',
                                                                                        ).toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Noto Sans',
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (functions.jsonToString(getJsonField(
                                                                                                waitListDTOItem,
                                                                                                r'''$.wtstatus''',
                                                                                              ).toString()) ==
                                                                                              'F') {
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                const Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.check_box_rounded,
                                                                                                    color: Color(0xFF979FA5),
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatusname''',
                                                                                                  ).toString(),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else if ((functions.jsonToString(getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatus''',
                                                                                                  ).toString()) ==
                                                                                                  'I') ||
                                                                                              (functions.jsonToString(getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatus''',
                                                                                                  ).toString()) ==
                                                                                                  'W')) {
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                const Icon(
                                                                                                  Icons.hourglass_top_outlined,
                                                                                                  color: Color(0xFFFFBE3A),
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatusname''',
                                                                                                  ).toString(),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else if (functions.jsonToString(getJsonField(
                                                                                                waitListDTOItem,
                                                                                                r'''$.wtstatus''',
                                                                                              ).toString()) ==
                                                                                              'A') {
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.cancel,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatusname''',
                                                                                                  ).toString(),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else if (functions.jsonToString(getJsonField(
                                                                                                waitListDTOItem,
                                                                                                r'''$.wtstatus''',
                                                                                              ).toString()) ==
                                                                                              'R') {
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                const Icon(
                                                                                                  Icons.bedroom_child,
                                                                                                  color: Color(0xFF666BFB),
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatusname''',
                                                                                                  ).toString(),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: const Color(0xFF4B39EF),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else {
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.crop_square,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    waitListDTOItem,
                                                                                                    r'''$.wtstatusname''',
                                                                                                  ).toString(),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if (functions.jsonToString(getJsonField(
                                                                                              waitListDTOItem,
                                                                                              r'''$.detailexist''',
                                                                                            ).toString()) ==
                                                                                            'Y') {
                                                                                          return Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: const Color(0x0014181B),
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: const Color(0xBD14181B),
                                                                                                icon: Icon(
                                                                                                  Icons.search_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                          child: WaitlistDetailComponentWidget(
                                                                                                            patid: _model.patid!,
                                                                                                            inspecdate: _model.inspecdate!,
                                                                                                            wrgroup: getJsonField(
                                                                                                              waitListDTOItem,
                                                                                                              r'''$.wrgroup''',
                                                                                                            ).toString(),
                                                                                                            encryptedChartnumber: _model.encryptedChartnumber,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: FlutterFlowIconButton(
                                                                                              borderColor: const Color(0x0014181B),
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 30.0,
                                                                                              fillColor: const Color(0x0014181B),
                                                                                              icon: const Icon(
                                                                                                Icons.search_rounded,
                                                                                                color: Colors.transparent,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              onPressed: () {
                                                                                                print('IconButton pressed ...');
                                                                                              },
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
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
                                                              );
                                                            } else {
                                                              return Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vyty32gg' /* 검사데이터 없음. */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (_model.processFlag == 5) {
                                    return wrapWithModel(
                                      model: _model.keyFinishComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: KeyFinishComponentWidget(
                                        registrationJson: getJsonField(
                                          (_model.registrationResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        ),
                                      ),
                                    );
                                  } else if (_model.processFlag == 6) {
                                    return wrapWithModel(
                                      model: _model.endComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const EndComponentWidget(),
                                    );
                                  } else {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '06qrzef0' /* 유효하지 않은 데이터입니다. */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: const BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.processFlag = _model.processFlag + 1;
                          safeSetState(() {});
                          if (_model.processFlag == 7) {
                            _model.processFlag = 1;
                            safeSetState(() {});
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 200.0,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            fit: BoxFit.fitWidth,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
