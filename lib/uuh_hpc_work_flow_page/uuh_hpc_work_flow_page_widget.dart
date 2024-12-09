import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'uuh_hpc_work_flow_page_model.dart';
export 'uuh_hpc_work_flow_page_model.dart';

class UuhHpcWorkFlowPageWidget extends StatefulWidget {
  const UuhHpcWorkFlowPageWidget({
    super.key,
    this.qstr,
    this.process,
  });

  final String? qstr;
  final String? process;

  @override
  State<UuhHpcWorkFlowPageWidget> createState() =>
      _UuhHpcWorkFlowPageWidgetState();
}

class _UuhHpcWorkFlowPageWidgetState extends State<UuhHpcWorkFlowPageWidget> {
  late UuhHpcWorkFlowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UuhHpcWorkFlowPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.qstr == null || widget.qstr == '') {
        _model.qstr = functions.getCurrentURL('qstr');
        safeSetState(() {});
        _model.process = functions.getCurrentURL('process');
        safeSetState(() {});
      } else {
        _model.qstr = widget.qstr;
        safeSetState(() {});
      }

      if (_model.qstr == null || _model.qstr == '') {
        context.goNamed('errorPage');

        return;
      }
      if (_model.process == 'before') {
        context.goNamed(
          'beforePage',
          queryParameters: {
            'qstr': serializeParam(
              _model.qstr,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      } else {
        if (_model.process == 'after') {
          context.goNamed(
            'afterPage',
            queryParameters: {
              'qstr': serializeParam(
                _model.qstr,
                ParamType.String,
              ),
            }.withoutNulls,
          );

          return;
        } else {
          if (_model.process == 'daily') {
            context.pushNamed(
              'hpcworkflowPage',
              queryParameters: {
                'qstr': serializeParam(
                  _model.qstr,
                  ParamType.String,
                ),
              }.withoutNulls,
            );

            return;
          }
        }
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '4qui92o6' /* 건강증진센터 모바일 웹 서비스 */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'beforePage',
                                  queryParameters: {
                                    'qstr': serializeParam(
                                      functions.urlEncode(_model.qstr!),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'vrwlo8ms' /* 검진 전 페이지 */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 80.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'hpcworkflowPage',
                                  queryParameters: {
                                    'qstr': serializeParam(
                                      functions.urlEncode(_model.qstr!),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'n65n5anj' /* 검진 진행사항 페이지 */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 80.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'afterPage',
                                  queryParameters: {
                                    'qstr': serializeParam(
                                      functions.urlEncode(_model.qstr!),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'tn94lmg3' /* 검진 후 페이지 */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 80.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 15.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: const BoxDecoration(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
