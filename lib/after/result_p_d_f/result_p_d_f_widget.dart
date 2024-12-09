import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'result_p_d_f_model.dart';
export 'result_p_d_f_model.dart';

class ResultPDFWidget extends StatefulWidget {
  const ResultPDFWidget({
    super.key,
    this.patid,
    this.inspecdate,
    this.filename,
    this.encryptedChartnumber,
  });

  final String? patid;
  final String? inspecdate;
  final String? filename;
  final String? encryptedChartnumber;

  @override
  State<ResultPDFWidget> createState() => _ResultPDFWidgetState();
}

class _ResultPDFWidgetState extends State<ResultPDFWidget> {
  late ResultPDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultPDFModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiGetResultPdf =
          await HHIARTSDocumentationGroup.getResultPdfUsingPOSTCall.call(
        patid: widget.patid,
        inspecdate: widget.inspecdate,
        filename: widget.filename,
        encryptedChartnumber: widget.encryptedChartnumber,
      );

      if ((_model.apiGetResultPdf?.succeeded ?? true)) {
        _model.pdfFilename =
            HHIARTSDocumentationGroup.getResultPdfUsingPOSTCall.filename(
          (_model.apiGetResultPdf?.jsonBody ?? ''),
        );
        safeSetState(() {});
        _model.loadComplete = true;
        safeSetState(() {});
      } else {
        _model.error = true;
        safeSetState(() {});
      }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              constraints: const BoxConstraints(
                maxWidth: 450.0,
              ),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.loadComplete == true) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'le8uohh1' /* PDF 파일이 준비되었습니다. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3mzwhft4' /* 아래 버튼을 눌러 다운로드하세요. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await launchURL(
                                        'https://pmobile.uuh.ulsan.kr:8443/${_model.pdfFilename}');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'mg654m3c' /* 다운로드 */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  'oh5oxe31' /* 암호는 생년월일 6자리 입니다. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          );
                        } else if (_model.error ?? false) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: FlutterFlowTheme.of(context).error,
                                size: 60.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '62isrtha' /* PDF 가져오는데 실패했습니다. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ks5jc90k' /* 다시 시도하거나 센터에 문의하세요. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 100.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/jsons/fileloading.json',
                                  width: 300.0,
                                  height: 300.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'awexvxnm' /* PDF를 다운로드 중입니다. */,
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
                              ],
                            ),
                          );
                        }
                      },
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
