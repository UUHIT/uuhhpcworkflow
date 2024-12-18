import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'after_page_model.dart';
export 'after_page_model.dart';

class AfterPageWidget extends StatefulWidget {
  ///  검진 전 페이지
  const AfterPageWidget({
    super.key,
    this.qstr,
  });

  final String? qstr;

  @override
  State<AfterPageWidget> createState() => _AfterPageWidgetState();
}

class _AfterPageWidgetState extends State<AfterPageWidget> {
  late AfterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AfterPageModel());

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

      _model.patid = valueOrDefault<String>(
        getJsonField(
          (_model.decryptParm?.jsonBody ?? ''),
          r'''$.patid''',
        )?.toString().toString(),
        '\$',
      );
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
        final afterPageGetRegistrationUsingPOSTResponse = snapshot.data!;

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
                                '3l55d61o' /* 건강한 삶의 동반자 */,
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
                                'mha9m1te' /* 울산대학교병원 건강증진센터 */,
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
                                afterPageGetRegistrationUsingPOSTResponse
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
                                      afterPageGetRegistrationUsingPOSTResponse
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
                                      afterPageGetRegistrationUsingPOSTResponse
                                          .jsonBody,
                                    )} 검진 완료되었습니다.',
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
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 12,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'afterCautionPage',
                                            queryParameters: {
                                              'patid': serializeParam(
                                                _model.patid,
                                                ParamType.String,
                                              ),
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
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'epciqq46' /* 💡 검진 후 유의사항 */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 90.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                                  ].divide(const SizedBox(width: 5.0)),
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
                                      flex: 12,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'afterSchedulePage',
                                            queryParameters: {
                                              'patid': serializeParam(
                                                _model.patid,
                                                ParamType.String,
                                              ),
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
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'z4tpc4e5' /* 🗓 상담 재방문검사 일정 */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 90.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFFEA7D02),
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
                                  ].divide(const SizedBox(width: 5.0)),
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
                                      flex: 12,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'afterResultPage',
                                            queryParameters: {
                                              'patid': serializeParam(
                                                _model.patid,
                                                ParamType.String,
                                              ),
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
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'syvgk1cc' /* 📑 결과확인 및 다운로드 */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 90.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF3E4649),
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
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ].divide(const SizedBox(height: 10.0)),
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
