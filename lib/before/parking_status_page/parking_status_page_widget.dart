import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'parking_status_page_model.dart';
export 'parking_status_page_model.dart';

class ParkingStatusPageWidget extends StatefulWidget {
  const ParkingStatusPageWidget({super.key});

  @override
  State<ParkingStatusPageWidget> createState() =>
      _ParkingStatusPageWidgetState();
}

class _ParkingStatusPageWidgetState extends State<ParkingStatusPageWidget>
    with TickerProviderStateMixin {
  late ParkingStatusPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingStatusPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      await _model.refreshStatus(context);
      _model.isLoading = false;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
            child: SizedBox(
              width: 450.0,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        'b30mjpap' /* 신관주차장 */,
                                      ),
                                      FontAwesomeIcons.carAlt),
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        'ow4bcxgr' /* 본관주차장 */,
                                      ),
                                      FontAwesomeIcons.carSide)
                                ],
                                onChanged: (val) async {
                                  safeSetState(() => _model.choiceChipsValue =
                                      val?.firstOrNull);
                                  _model.parkingStatusJson = [];
                                  safeSetState(() {});
                                  _model.isLoading = true;
                                  safeSetState(() {});
                                  await _model.refreshStatus(context);
                                  _model.isLoading = false;
                                  safeSetState(() {});
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  labelPadding: const EdgeInsets.all(5.0),
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.center,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [
                                    FFLocalizations.of(context).getText(
                                      'j7afckxv' /* 신관주차장 */,
                                    )
                                  ],
                                ),
                                wrapped: true,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.parkingStatusJson = [];
                                safeSetState(() {});
                                _model.isLoading = true;
                                safeSetState(() {});
                                await _model.refreshStatus(context);
                                _model.isLoading = false;
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.refresh_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 32.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final eachStatus =
                                  _model.parkingStatusJson.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: eachStatus.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, eachStatusIndex) {
                                  final eachStatusItem =
                                      eachStatus[eachStatusIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 15.0, 10.0, 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          getJsonField(
                                                            eachStatusItem,
                                                            r'''$.asSlotNum''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                maxChars: 1,
                                                              ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          minFontSize: 14.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: AutoSizeText(
                                                            (String var1) {
                                                              return var1 ==
                                                                      "B1"
                                                                  ? "1"
                                                                  : (var1 == "G"
                                                                      ? " "
                                                                      : "F");
                                                            }(getJsonField(
                                                              eachStatusItem,
                                                              r'''$.asSlotNum''',
                                                            ).toString())
                                                                .maybeHandleOverflow(
                                                              maxChars: 8,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            minFontSize: 14.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model.place == 'NEW')
                                                  Builder(
                                                    builder: (context) {
                                                      if ((String var1,
                                                              String var2) {
                                                        return var2 == 'NEW'
                                                            ? (var1 == 'G' ||
                                                                    var1 == '6F'
                                                                ? true
                                                                : false)
                                                            : false;
                                                      }(
                                                          getJsonField(
                                                            eachStatusItem,
                                                            r'''$.asSlotNum''',
                                                          ).toString(),
                                                          _model.place)) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'e4p5e15r' /* >> 출입구 */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'twelwcu0' /*        */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                if (_model.place == 'OLD')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      (String var1) {
                                                        return var1 == '7F'
                                                            ? '>>입구'
                                                            : (var1 == '1F'
                                                                ? '>>출구'
                                                                : '');
                                                      }(getJsonField(
                                                        eachStatusItem,
                                                        r'''$.asSlotNum''',
                                                      ).toString()),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    getJsonField(
                                                      eachStatusItem,
                                                      r'''$.asOccPer''',
                                                    ).toString(),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color:
                                                              colorFromCssString(
                                                            (String var1) {
                                                              return (var1 ==
                                                                      '혼잡')
                                                                  ? "#F45226"
                                                                  : "#049D97";
                                                            }(getJsonField(
                                                              eachStatusItem,
                                                              r'''$.asOccPer''',
                                                            ).toString()),
                                                            defaultColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                          border: Border.all(
                                                            color:
                                                                colorFromCssString(
                                                              (String var1) {
                                                                return (var1 ==
                                                                        '혼잡')
                                                                    ? "#F45226"
                                                                    : "#049D97";
                                                              }(getJsonField(
                                                                eachStatusItem,
                                                                r'''$.asOccPer''',
                                                              ).toString()),
                                                              defaultColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    eachStatusItem,
                                                                    r'''$.asPCnt''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color:
                                                                            colorFromCssString(
                                                                          (String
                                                                              var1) {
                                                                            return (var1 == '혼잡')
                                                                                ? "#F45226"
                                                                                : "#049D97";
                                                                          }(getJsonField(
                                                                            eachStatusItem,
                                                                            r'''$.asOccPer''',
                                                                          ).toString()),
                                                                          defaultColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ie445kp3' /* 대 가능 */,
                                                                  ),
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Noto Sans',
                                                                    color:
                                                                        colorFromCssString(
                                                                      (String
                                                                          var1) {
                                                                        return (var1 ==
                                                                                '혼잡')
                                                                            ? "#F45226"
                                                                            : "#049D97";
                                                                      }(getJsonField(
                                                                        eachStatusItem,
                                                                        r'''$.asOccPer''',
                                                                      ).toString()),
                                                                      defaultColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 20.0)),
                  ),
                  if (_model.isLoading == true)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/jsons/running_car.json',
                        width: 150.0,
                        height: 106.0,
                        fit: BoxFit.cover,
                        animate: true,
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
