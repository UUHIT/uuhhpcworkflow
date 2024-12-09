// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // for base64 decoding
import 'dart:typed_data'; // for Uint8List
import 'dart:html' as html; // for web download

class PdfDownLoad extends StatefulWidget {
  const PdfDownLoad({
    super.key,
    this.width,
    this.height,
    this.pdfBase64Input,
    this.filename,
  });

  final double? width;
  final double? height;
  final String? pdfBase64Input;
  final String? filename;

  @override
  State<PdfDownLoad> createState() => _PdfDownLoadState();
}

class _PdfDownLoadState extends State<PdfDownLoad> {
  String? _pdfBytes;
  String _filename = "";

  @override
  void initState() {
    super.initState();
    if (widget.pdfBase64Input != null) {
      _pdfBytes = widget.pdfBase64Input!;
    }
    if (widget.filename != null) {
      _filename = widget.filename!;
    }
  }

  void downloadPdf() async {
    try {
      // base64 문자열을 바이트로 디코딩
      final List<int> bytes = base64.decode(_pdfBytes!);

      // 현재 시간을 파일명에 추가
      final now = DateTime.now();
      final timestamp =
          "${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}";
      final filename = "document_$timestamp.pdf";

      // 카카오톡 인앱 브라우저 체크
      final userAgent = html.window.navigator.userAgent.toLowerCase();
      final isKakao = userAgent.contains('kakao');

      if (isKakao) {
        // 카카오톡 인앱 브라우저인 경우 새 창에서 열기
        final blob = html.Blob([Uint8List.fromList(bytes)], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);

        html.window.open(url, '_blank');

        // URL 해제는 약간의 지연 후 수행
        await Future.delayed(Duration(seconds: 1));
        html.Url.revokeObjectUrl(url);
      } else {
        // 일반 브라우저에서는 기존 방식으로 다운로드
        final blob = html.Blob([Uint8List.fromList(bytes)]);
        final url = html.Url.createObjectUrlFromBlob(blob);

        final anchor = html.AnchorElement(href: url)
          ..target = '_blank'
          ..download = filename
          ..click();

        html.Url.revokeObjectUrl(url);
      }
    } catch (e) {
      print('PDF 다운로드 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 배경을 투명으로 설정
      body: Center(
        child: Container(
          width: 100, // 버튼의 가로 크기
          height: 100, // 버튼의 세로 크기
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 6, 100, 115), // 배경 색상
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: downloadPdf,
            backgroundColor: Colors.transparent, // FloatingActionButton 배경 투명
            foregroundColor: Colors.white, // 아이콘 색상 설정
            elevation: 0, // 그림자 제거
            child: Icon(
              Icons.download,
              size: 50, // 아이콘 크기 키우기
            ),
          ),
        ),
      ),
    );
  }
}
