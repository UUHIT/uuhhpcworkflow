import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'inspectable_page_model.dart';
export 'inspectable_page_model.dart';

class InspectablePageWidget extends StatefulWidget {
  const InspectablePageWidget({
    super.key,
    this.inspecdate,
    this.encryptedChartnumber,
    this.patid,
  });

  final String? inspecdate;
  final String? encryptedChartnumber;
  final String? patid;

  @override
  State<InspectablePageWidget> createState() => _InspectablePageWidgetState();
}

class _InspectablePageWidgetState extends State<InspectablePageWidget> {
  late InspectablePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InspectablePageModel());

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
      future: HHIARTSDocumentationGroup.getBeforeNoticeInfoUsingPOSTCall.call(
        patid: widget.patid,
        inspecdate: widget.inspecdate,
        encryptedChartnumber: widget.encryptedChartnumber,
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
        final inspectablePageGetBeforeNoticeInfoUsingPOSTResponse =
            snapshot.data!;

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
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
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
                                      'xr8apan6' /* 예약 현황 및 안내사항 */,
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
                                      '5o6pqnnp' /* 검사별 준비사항을 꼭 확인해주시길 바랍니다. */,
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
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await launchURL(
                                                HHIARTSDocumentationGroup
                                                    .getBeforeNoticeInfoUsingPOSTCall
                                                    .standard(
                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                  .jsonBody,
                                            )!);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'v8ytuaf0' /* 📢 공통안내사항 */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 70.0,
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
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 8.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (HHIARTSDocumentationGroup
                                                  .getBeforeNoticeInfoUsingPOSTCall
                                                  .female(
                                                inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                    .jsonBody,
                                              ) !=
                                              '-') {
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                await launchURL(
                                                    HHIARTSDocumentationGroup
                                                        .getBeforeNoticeInfoUsingPOSTCall
                                                        .female(
                                                  inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                      .jsonBody,
                                                )!);
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'p5mzzmbt' /* 🙆‍♀️ 여성검진 */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 70.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color: Colors.white,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 8.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: 0.0,
                                              height: 0.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if ((HHIARTSDocumentationGroup
                                                      .getBeforeNoticeInfoUsingPOSTCall
                                                      .foodnotice(
                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '-') ||
                                              (HHIARTSDocumentationGroup
                                                      .getBeforeNoticeInfoUsingPOSTCall
                                                      .ma1ma5(
                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '-') ||
                                              (HHIARTSDocumentationGroup
                                                      .getBeforeNoticeInfoUsingPOSTCall
                                                      .sd3(
                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '-')) {
                                            return Container(
                                              width: double.infinity,
                                              constraints: const BoxConstraints(
                                                maxWidth: 570.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  width: 5.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: Column(
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
                                                        'f8mcvx0x' /* 💡필수유의사항💡 */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    if ((HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .foodnotice(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') ||
                                                        (HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .ma1ma5(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') ||
                                                        (HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .sd3(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-'))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Column(
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
                                                                'eswulenu' /* 내시경 안내사항 */,
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
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'cvpcpjaj' /* 내시경 검사가 있으시네요.😃
아래 버튼을 눌러 준비사... */
                                                                ,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (HHIARTSDocumentationGroup
                                                                        .getBeforeNoticeInfoUsingPOSTCall
                                                                        .ma1ma5(
                                                                      inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    '-') {
                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await launchURL(HHIARTSDocumentationGroup
                                                                          .getBeforeNoticeInfoUsingPOSTCall
                                                                          .ma1ma5(
                                                                        inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                            .jsonBody,
                                                                      )!);
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'u5vwiqq0' /*  🔬 위내시경 안내 */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          80.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFF3E4649),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      elevation:
                                                                          8.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  );
                                                                } else if (HHIARTSDocumentationGroup
                                                                        .getBeforeNoticeInfoUsingPOSTCall
                                                                        .sd3(
                                                                      inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    '-') {
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await launchURL(HHIARTSDocumentationGroup
                                                                              .getBeforeNoticeInfoUsingPOSTCall
                                                                              .foodnotice(
                                                                            inspectablePageGetBeforeNoticeInfoUsingPOSTResponse.jsonBody,
                                                                          )!);
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'j6x89au0' /*  🍽 식이조절 가이드 */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              80.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              const Color(0xFF3E4649),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Noto Sans',
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          elevation:
                                                                              8.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await launchURL(HHIARTSDocumentationGroup
                                                                              .getBeforeNoticeInfoUsingPOSTCall
                                                                              .sd3(
                                                                            inspectablePageGetBeforeNoticeInfoUsingPOSTResponse.jsonBody,
                                                                          )!);
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'y2j0tr2x' /*  🥛 장정결제 복용방법 */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              80.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              const Color(0xFF3E4649),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Noto Sans',
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          elevation:
                                                                              8.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width: 0.0,
                                                                    height: 0.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    if (HHIARTSDocumentationGroup
                                                            .getBeforeNoticeInfoUsingPOSTCall
                                                            .sd5(
                                                          inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                              .jsonBody,
                                                        ) !=
                                                        '-')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Column(
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
                                                                'ycxdhhje' /* 대장암DNA분변검사 */,
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
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '2ag8lya3' /* 대장암DNA분변검사가 있으시네요.😃
아래 버튼을 눌러... */
                                                                ,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            if (HHIARTSDocumentationGroup
                                                                    .getBeforeNoticeInfoUsingPOSTCall
                                                                    .sd5(
                                                                  inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-')
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await launchURL(
                                                                      HHIARTSDocumentationGroup
                                                                          .getBeforeNoticeInfoUsingPOSTCall
                                                                          .sd5(
                                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                        .jsonBody,
                                                                  )!);
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nx13do08' /* 💩 얼리텍 분변채취방법 */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 80.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFF3E4649),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      8.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    if ((HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .ct(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') ||
                                                        (HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .mr(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-') ||
                                                        (HHIARTSDocumentationGroup
                                                                .getBeforeNoticeInfoUsingPOSTCall
                                                                .petct(
                                                              inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '-'))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Column(
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
                                                                'tr58cpsz' /* 영상검사 안내사항 */,
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
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pomjbxzs' /* 영상검사가 있으시네요.😃
아래 버튼을 눌러 준비사항을... */
                                                                ,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            if (HHIARTSDocumentationGroup
                                                                    .getBeforeNoticeInfoUsingPOSTCall
                                                                    .ct(
                                                                  inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-')
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await launchURL(
                                                                      HHIARTSDocumentationGroup
                                                                          .getBeforeNoticeInfoUsingPOSTCall
                                                                          .ct(
                                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                        .jsonBody,
                                                                  )!);
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'g51o2zsm' /* 💉 조영제CT */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 80.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFF3E4649),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      8.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            if (HHIARTSDocumentationGroup
                                                                    .getBeforeNoticeInfoUsingPOSTCall
                                                                    .mr(
                                                                  inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-')
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await launchURL(
                                                                      HHIARTSDocumentationGroup
                                                                          .getBeforeNoticeInfoUsingPOSTCall
                                                                          .mr(
                                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                        .jsonBody,
                                                                  )!);
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ukup38cv' /* 🛌 MR 촬영 */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 80.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFF3E4649),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      8.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            if (HHIARTSDocumentationGroup
                                                                    .getBeforeNoticeInfoUsingPOSTCall
                                                                    .petct(
                                                                  inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '-')
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await launchURL(
                                                                      HHIARTSDocumentationGroup
                                                                          .getBeforeNoticeInfoUsingPOSTCall
                                                                          .petct(
                                                                    inspectablePageGetBeforeNoticeInfoUsingPOSTResponse
                                                                        .jsonBody,
                                                                  )!);
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'y391j5k4' /*  📡 PET-CT 촬영 */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 80.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFF3E4649),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      8.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: 0.0,
                                              height: 0.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ],
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
