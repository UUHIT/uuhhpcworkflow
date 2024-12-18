import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'error_page_model.dart';
export 'error_page_model.dart';

class ErrorPageWidget extends StatefulWidget {
  const ErrorPageWidget({super.key});

  @override
  State<ErrorPageWidget> createState() => _ErrorPageWidgetState();
}

class _ErrorPageWidgetState extends State<ErrorPageWidget> {
  late ErrorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorPageModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.info,
                color: Color(0xFFC5010C),
                size: 100.0,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'zlk27afq' /* 올바르지 않은 접근입니다. */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto Sans',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
