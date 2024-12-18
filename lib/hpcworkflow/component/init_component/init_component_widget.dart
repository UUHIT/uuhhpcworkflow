import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'init_component_model.dart';
export 'init_component_model.dart';

class InitComponentWidget extends StatefulWidget {
  const InitComponentWidget({
    super.key,
    required this.registrationJson,
  });

  final dynamic registrationJson;

  @override
  State<InitComponentWidget> createState() => _InitComponentWidgetState();
}

class _InitComponentWidgetState extends State<InitComponentWidget>
    with TickerProviderStateMixin {
  late InitComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitComponentModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'barcodeOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.95,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '6i4bhjpa' /* 건강한 삶의 동반자 */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Noto Sans',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '30rs0ymp' /* 울산대학교병원 건강증진센터 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '${getJsonField(
                      widget.registrationJson,
                      r'''$.patname''',
                    ).toString()}님 반갑습니다.😃',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '⏰${getJsonField(
                      widget.registrationJson,
                      r'''$.inspecdate''',
                    ).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '${getJsonField(
                      widget.registrationJson,
                      r'''$.wtarea''',
                    ).toString()} 검진입니다.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: BarcodeWidget(
                data: getJsonField(
                  widget.registrationJson,
                  r'''$.chartnumber''',
                ).toString(),
                barcode: Barcode.qrCode(),
                width: 150.0,
                height: 150.0,
                color: FlutterFlowTheme.of(context).primaryText,
                backgroundColor: Colors.transparent,
                errorBuilder: (context, error) => const SizedBox(
                  width: 150.0,
                  height: 150.0,
                ),
                drawText: false,
              ).animateOnPageLoad(animationsMap['barcodeOnPageLoadAnimation']!),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'm9hvcp8j' /* QR코드를 무인기에 인식해주세요. */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/kioskguide.png',
                  width: 150.0,
                  height: 300.0,
                  fit: BoxFit.contain,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
          ].divide(const SizedBox(height: 0.0)),
        ),
      ),
    );
  }
}
