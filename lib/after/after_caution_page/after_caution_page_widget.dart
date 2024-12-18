import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'after_caution_page_model.dart';
export 'after_caution_page_model.dart';

class AfterCautionPageWidget extends StatefulWidget {
  const AfterCautionPageWidget({
    super.key,
    this.patid,
    this.inspecdate,
    this.encryptedChartnumber,
  });

  final String? patid;
  final String? inspecdate;
  final String? encryptedChartnumber;

  @override
  State<AfterCautionPageWidget> createState() => _AfterCautionPageWidgetState();
}

class _AfterCautionPageWidgetState extends State<AfterCautionPageWidget> {
  late AfterCautionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AfterCautionPageModel());

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
      future: HHIARTSDocumentationGroup.getAfterNoticeInfoUsingPOSTCall.call(
        patid: widget.patid,
        inspecdate: widget.inspecdate,
        encryptedChartnumber: widget.encryptedChartnumber,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final afterCautionPageGetAfterNoticeInfoUsingPOSTResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1eogghmt' /* 검진 후 유의사항💡 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'uhzaiarz' /* 각 검사별 유의사항을 확인하세요. */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if ((HHIARTSDocumentationGroup
                                                .getAfterNoticeInfoUsingPOSTCall
                                                .endostandard(
                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                  .jsonBody,
                                            ) !=
                                            '-') ||
                                        (HHIARTSDocumentationGroup
                                                .getAfterNoticeInfoUsingPOSTCall
                                                .endoscope5(
                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                  .jsonBody,
                                            ) !=
                                            '-')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 8.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 570.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'l3muflk7' /* < 내시경검사 안내 > */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  if (HHIARTSDocumentationGroup
                                                          .getAfterNoticeInfoUsingPOSTCall
                                                          .endostandard(
                                                        afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                            .jsonBody,
                                                      ) !=
                                                      '-')
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0nu7hj69' /* 📢 내시경 공통 안내 */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endostandard(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            )!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  if (HHIARTSDocumentationGroup
                                                          .getAfterNoticeInfoUsingPOSTCall
                                                          .endoscope1(
                                                        afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                            .jsonBody,
                                                      ) !=
                                                      '-')
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wz28j7zz' /* 🔬 위 내시경 하셨네요. */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endoscope1(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            )!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  if (HHIARTSDocumentationGroup
                                                          .getAfterNoticeInfoUsingPOSTCall
                                                          .endoscope2(
                                                        afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                            .jsonBody,
                                                      ) !=
                                                      '-')
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ocpnqi1u' /* 🔎 대장 내시경 하셨네요. */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endoscope2(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            )!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  if ((HHIARTSDocumentationGroup
                                                              .getAfterNoticeInfoUsingPOSTCall
                                                              .endoscope3(
                                                            afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '-') ||
                                                      (HHIARTSDocumentationGroup
                                                              .getAfterNoticeInfoUsingPOSTCall
                                                              .endoscope4(
                                                            afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '-'))
                                                    Builder(
                                                      builder: (context) {
                                                        if (HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endoscope4(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') {
                                                          return Visibility(
                                                            visible: HHIARTSDocumentationGroup
                                                                    .getAfterNoticeInfoUsingPOSTCall
                                                                    .endoscope4(
                                                                  afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-',
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: HHIARTSDocumentationGroup
                                                                  .getDisreqExistUsingPOSTCall
                                                                  .call(
                                                                patid: widget
                                                                    .patid,
                                                                inspecdate: widget
                                                                    .inspecdate,
                                                                encryptedChartnumber:
                                                                    widget
                                                                        .encryptedChartnumber,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnGetDisreqExistUsingPOSTResponse =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8o73ec2y' /* 🧬 내시경적 절제술 하셨네요. */,
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
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        HHIARTSDocumentationGroup
                                                                            .getAfterNoticeInfoUsingPOSTCall
                                                                            .endoscope4(
                                                                          afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (HHIARTSDocumentationGroup.getDisreqExistUsingPOSTCall.data(
                                                                              columnGetDisreqExistUsingPOSTResponse.jsonBody,
                                                                            ) !=
                                                                            null) {
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pwybkp9r' /* 진단서 신청내역이 있습니다. */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '대상검사 : ${HHIARTSDocumentationGroup.getDisreqExistUsingPOSTCall.headname(
                                                                                  columnGetDisreqExistUsingPOSTResponse.jsonBody,
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '신청일자 : ${functions.dateFormatKR(HHIARTSDocumentationGroup.getDisreqExistUsingPOSTCall.reqdate(
                                                                                  columnGetDisreqExistUsingPOSTResponse.jsonBody,
                                                                                ))}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else {
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: const Text('진단서 신청'),
                                                                                                content: const Text('진단서 발급을 신청하시겠습니까?'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: const Text('취소'),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: const Text('신청'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ) ??
                                                                                          false;
                                                                                      if (confirmDialogResponse) {
                                                                                        _model.apiResultbef = await HHIARTSDocumentationGroup.insertDisreqUsingPOSTCall.call(
                                                                                          patid: widget.patid,
                                                                                          inspecdate: widget.inspecdate,
                                                                                          encryptedChartnumber: widget.encryptedChartnumber,
                                                                                        );

                                                                                        if ((_model.apiResultbef?.succeeded ?? true)) {
                                                                                          context.goNamed(
                                                                                            'afterCautionPage',
                                                                                            queryParameters: {
                                                                                              'patid': serializeParam(
                                                                                                widget.patid,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'inspecdate': serializeParam(
                                                                                                widget.inspecdate,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'encryptedChartnumber': serializeParam(
                                                                                                widget.encryptedChartnumber,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'b7lwwmc3' /* 내시경적절제술 진단서 신청 */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 50.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Noto Sans',
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '5f8kvl7v' /* 진단서를 미리 신청하고 빠르게 받아볼 수 있습니다. */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                    Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        } else if (HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endoscope3(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') {
                                                          return Visibility(
                                                            visible: HHIARTSDocumentationGroup
                                                                    .getAfterNoticeInfoUsingPOSTCall
                                                                    .endoscope3(
                                                                  afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-',
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '676gmrrs' /* 🧫 조직검사 하셨네요. */,
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
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    HHIARTSDocumentationGroup
                                                                        .getAfterNoticeInfoUsingPOSTCall
                                                                        .endoscope3(
                                                                      afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                          .jsonBody,
                                                                    )!,
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
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  if (HHIARTSDocumentationGroup
                                                          .getAfterNoticeInfoUsingPOSTCall
                                                          .endoscope5(
                                                        afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                            .jsonBody,
                                                      ) !=
                                                      '-')
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wkfmkfuu' /* 📑 서류 안내 */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans',
                                                                color: const Color(
                                                                    0xFFF8185F),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            HHIARTSDocumentationGroup
                                                                .getAfterNoticeInfoUsingPOSTCall
                                                                .endoscope5(
                                                              afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            )!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  color: const Color(
                                                                      0xFFF8185F),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                ].divide(
                                                    const SizedBox(height: 30.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    if (HHIARTSDocumentationGroup
                                            .getAfterNoticeInfoUsingPOSTCall
                                            .ct(
                                          afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                              .jsonBody,
                                        ) !=
                                        '-') {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 8.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 570.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'sdm5s5a2' /* < CT검사 안내 > */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8ng37h73' /* 💉 조영제CT 유의사항 */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          HHIARTSDocumentationGroup
                                                              .getAfterNoticeInfoUsingPOSTCall
                                                              .ct(
                                                            afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                .jsonBody,
                                                          )!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 20.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    if (HHIARTSDocumentationGroup
                                            .getAfterNoticeInfoUsingPOSTCall
                                            .g18(
                                          afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                              .jsonBody,
                                        ) !=
                                        '-') {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 8.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 570.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'jlw5nvvv' /* < 부인과 검사 안내 > */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'b8sonc5j' /* 🙆‍♀️ 부인과 기본 안내 */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          HHIARTSDocumentationGroup
                                                              .getAfterNoticeInfoUsingPOSTCall
                                                              .g18(
                                                            afterCautionPageGetAfterNoticeInfoUsingPOSTResponse
                                                                .jsonBody,
                                                          )!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 20.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
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
