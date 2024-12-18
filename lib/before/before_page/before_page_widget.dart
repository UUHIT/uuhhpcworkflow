import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'before_page_model.dart';
export 'before_page_model.dart';

class BeforePageWidget extends StatefulWidget {
  ///  검진 전 페이지
  const BeforePageWidget({
    super.key,
    this.qstr,
  });

  final String? qstr;

  @override
  State<BeforePageWidget> createState() => _BeforePageWidgetState();
}

class _BeforePageWidgetState extends State<BeforePageWidget> {
  late BeforePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeforePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.qstr == null || widget.qstr == '') {
        _model.qstr = functions.getCurrentURL('qstr');
        safeSetState(() {});
      } else {
        _model.qstr = widget.qstr;
        safeSetState(() {});
      }

      if (_model.qstr == null || _model.qstr == '') {
        context.goNamed('errorPage');

        return;
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
    return FutureBuilder<ApiCallResponse>(
      future: HHIARTSDocumentationGroup.getRegistrationUsingPOSTCall.call(
        patid: _model.patid,
        inspecdate: _model.inspecdate,
        encryptedChartnumber: _model.encryptedChartnumber,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final beforePageGetRegistrationUsingPOSTResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
                  width: 450.0,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.95,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.95,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ge3zy1ub' /* 건강한 삶의 동반자 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'aksv51yy' /* 울산대학교병원 건강증진센터 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              '${HHIARTSDocumentationGroup.getRegistrationUsingPOSTCall.patname(
                                beforePageGetRegistrationUsingPOSTResponse
                                    .jsonBody,
                              )}님 반갑습니다.😃',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '⏰${functions.dateFormatKR(HHIARTSDocumentationGroup.getRegistrationUsingPOSTCall.inspecdate(
                                      beforePageGetRegistrationUsingPOSTResponse
                                          .jsonBody,
                                    ))}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    '${HHIARTSDocumentationGroup.getRegistrationUsingPOSTCall.wtarea(
                                      beforePageGetRegistrationUsingPOSTResponse
                                          .jsonBody,
                                    )} 검진입니다.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'inspectablePage',
                                            queryParameters: {
                                              'inspecdate': serializeParam(
                                                _model.inspecdate,
                                                ParamType.String,
                                              ),
                                              'encryptedChartnumber':
                                                  serializeParam(
                                                functions.urlEncode(_model
                                                    .encryptedChartnumber!),
                                                ParamType.String,
                                              ),
                                              'patid': serializeParam(
                                                _model.patid,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          elevation: 8.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'kha0bhnw' /* 예약현황📑 */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bjv9jkdt' /* 검진 전 유의사항💡 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
                                                    height: 24.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                5.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                5.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                5.0),
                                                        topRight:
                                                            Radius.circular(
                                                                5.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  3.0,
                                                                  8.0,
                                                                  3.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rf0tuou0' /* 바로가기 */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 0.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'hpcworkflowPage',
                                              queryParameters: {
                                                'qstr': serializeParam(
                                                  functions
                                                      .urlEncode(_model.qstr!),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'uqxki7bm' /* ✨ 도착 후 QR 체크인 */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 80.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFFF07F01),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Noto Sans',
                                                      color: Colors.white,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 4.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 0.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchURL(
                                                      'https://health.uuh.ulsan.kr/health/index.php?pCode=MN000080');
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7sc5w708' /* 🗺 오시는길 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 80.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFF3E4649),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 4.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'ParkingStatusPage');
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '8mqtenbm' /* 🚗 주차안내 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 80.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFF3E4649),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 4.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 0.0)),
                                ),
                              ].divide(const SizedBox(height: 0.0)),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 200.0,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              fit: BoxFit.contain,
                              alignment: const Alignment(0.0, 0.0),
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
      },
    );
  }
}
