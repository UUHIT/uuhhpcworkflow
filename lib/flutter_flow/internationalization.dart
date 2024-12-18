import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
  }) =>
      [koText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // hpcworkflowPage
  {
    'nkxoi14c': {
      'ko': '님 ',
      'en': '',
    },
    'gapgm0kb': {
      'ko': '😊',
      'en': '',
    },
    'ltpt2eyw': {
      'ko': ' 검사현황',
      'en': '',
    },
    'vx5nftwb': {
      'ko': '안내사항',
      'en': '',
    },
    'hx3ycb8l': {
      'ko': '검사가 모두 완료되었습니다.',
      'en': '',
    },
    '2tk73va5': {
      'ko': '진행사항',
      'en': '',
    },
    '3jxq5j7q': {
      'ko': '\n',
      'en': '',
    },
    'vi1funu6': {
      'ko': '진행사항 없음',
      'en': '',
    },
    'eg3eep4p': {
      'ko': '방번호',
      'en': '',
    },
    '0c69hsob': {
      'ko': '검사실',
      'en': '',
    },
    'yzgzh9qq': {
      'ko': '상태',
      'en': '',
    },
    'rcs00v03': {
      'ko': '항목',
      'en': '',
    },
    'vyty32gg': {
      'ko': '검사데이터 없음.',
      'en': '',
    },
    '06qrzef0': {
      'ko': '유효하지 않은 데이터입니다.',
      'en': '',
    },
    'jgulzk64': {
      'ko': 'Home',
      'en': '',
    },
  },
  // beforePage
  {
    'ge3zy1ub': {
      'ko': '건강한 삶의 동반자',
      'en': '',
    },
    'aksv51yy': {
      'ko': '울산대학교병원 건강증진센터',
      'en': '',
    },
    'kha0bhnw': {
      'ko': '예약현황📑',
      'en': '',
    },
    'bjv9jkdt': {
      'ko': '검진 전 유의사항💡',
      'en': '',
    },
    'rf0tuou0': {
      'ko': '바로가기',
      'en': '',
    },
    'uqxki7bm': {
      'ko': '✨ 도착 후 QR 체크인',
      'en': '',
    },
    '7sc5w708': {
      'ko': '🗺 오시는길',
      'en': '',
    },
    '8mqtenbm': {
      'ko': '🚗 주차안내',
      'en': '',
    },
    '8i4llrgi': {
      'ko': 'Home',
      'en': '',
    },
  },
  // inspectablePage
  {
    'xr8apan6': {
      'ko': '예약 현황 및 안내사항',
      'en': '',
    },
    '5o6pqnnp': {
      'ko': '검사별 준비사항을 꼭 확인해주시길 바랍니다.',
      'en': '',
    },
    'v8ytuaf0': {
      'ko': '📢 공통안내사항',
      'en': '',
    },
    'p5mzzmbt': {
      'ko': '🙆‍♀️ 여성검진',
      'en': '',
    },
    'f8mcvx0x': {
      'ko': '💡필수유의사항💡',
      'en': '',
    },
    'eswulenu': {
      'ko': '내시경 안내사항',
      'en': '',
    },
    'cvpcpjaj': {
      'ko': '내시경 검사가 있으시네요.😃\n아래 버튼을 눌러 준비사항을 확인하세요.',
      'en': '',
    },
    'u5vwiqq0': {
      'ko': ' 🔬 위내시경 안내',
      'en': '',
    },
    'j6x89au0': {
      'ko': ' 🍽 식이조절 가이드',
      'en': '',
    },
    'y2j0tr2x': {
      'ko': ' 🥛 장정결제 복용방법',
      'en': '',
    },
    'ycxdhhje': {
      'ko': '대장암DNA분변검사',
      'en': '',
    },
    '2ag8lya3': {
      'ko': '대장암DNA분변검사가 있으시네요.😃\n아래 버튼을 눌러 준비사항을 확인하세요.',
      'en': '',
    },
    'nx13do08': {
      'ko': '💩 얼리텍 분변채취방법',
      'en': '',
    },
    'tr58cpsz': {
      'ko': '영상검사 안내사항',
      'en': '',
    },
    'pomjbxzs': {
      'ko': '영상검사가 있으시네요.😃\n아래 버튼을 눌러 준비사항을 확인하세요.',
      'en': '',
    },
    'g51o2zsm': {
      'ko': '💉 조영제CT',
      'en': '',
    },
    'ukup38cv': {
      'ko': '🛌 MR 촬영',
      'en': '',
    },
    'y391j5k4': {
      'ko': ' 📡 PET-CT 촬영',
      'en': '',
    },
    'u92ue5a2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // uuhHpcWorkFlowPage
  {
    '4qui92o6': {
      'ko': '건강증진센터 모바일 웹 서비스',
      'en': '',
    },
    'vrwlo8ms': {
      'ko': '검진 전 페이지',
      'en': '',
    },
    'n65n5anj': {
      'ko': '검진 진행사항 페이지',
      'en': '',
    },
    'tn94lmg3': {
      'ko': '검진 후 페이지',
      'en': '',
    },
    '1y4n5k3u': {
      'ko': 'Home',
      'en': '',
    },
  },
  // afterPage
  {
    '3l55d61o': {
      'ko': '건강한 삶의 동반자',
      'en': '',
    },
    'mha9m1te': {
      'ko': '울산대학교병원 건강증진센터',
      'en': '',
    },
    'epciqq46': {
      'ko': '💡 검진 후 유의사항',
      'en': '',
    },
    'z4tpc4e5': {
      'ko': '🗓 상담 재방문검사 일정',
      'en': '',
    },
    'syvgk1cc': {
      'ko': '📑 결과확인 및 다운로드',
      'en': '',
    },
    'q7xyayfs': {
      'ko': 'Home',
      'en': '',
    },
  },
  // afterCautionPage
  {
    '1eogghmt': {
      'ko': '검진 후 유의사항💡',
      'en': '',
    },
    'uhzaiarz': {
      'ko': '각 검사별 유의사항을 확인하세요.',
      'en': '',
    },
    'l3muflk7': {
      'ko': '< 내시경검사 안내 >',
      'en': '',
    },
    '0nu7hj69': {
      'ko': '📢 내시경 공통 안내',
      'en': '',
    },
    'wz28j7zz': {
      'ko': '🔬 위 내시경 하셨네요.',
      'en': '',
    },
    'ocpnqi1u': {
      'ko': '🔎 대장 내시경 하셨네요.',
      'en': '',
    },
    '8o73ec2y': {
      'ko': '🧬 내시경적 절제술 하셨네요.',
      'en': '',
    },
    'pwybkp9r': {
      'ko': '진단서 신청내역이 있습니다.',
      'en': '',
    },
    'b7lwwmc3': {
      'ko': '내시경적절제술 진단서 신청',
      'en': '',
    },
    '5f8kvl7v': {
      'ko': '진단서를 미리 신청하고 빠르게 받아볼 수 있습니다.',
      'en': '',
    },
    '676gmrrs': {
      'ko': '🧫 조직검사 하셨네요.',
      'en': '',
    },
    'wkfmkfuu': {
      'ko': '📑 서류 안내',
      'en': '',
    },
    'sdm5s5a2': {
      'ko': '< CT검사 안내 >',
      'en': '',
    },
    '8ng37h73': {
      'ko': '💉 조영제CT 유의사항',
      'en': '',
    },
    'jlw5nvvv': {
      'ko': '< 부인과 검사 안내 >',
      'en': '',
    },
    'b8sonc5j': {
      'ko': '🙆‍♀️ 부인과 기본 안내',
      'en': '',
    },
    '9gykwera': {
      'ko': 'Home',
      'en': '',
    },
  },
  // afterSchedulePage
  {
    't2etavzw': {
      'ko': '검진 후 스케쥴',
      'en': '',
    },
    '3q51w4qd': {
      'ko': '결과 상담 및 재방문 검사 일정을 확인하세요.',
      'en': '',
    },
    'tj515mkf': {
      'ko': '완료 😃',
      'en': '',
    },
    '1jbzq5p4': {
      'ko': 'Home',
      'en': '',
    },
  },
  // afterResultPage
  {
    '69cwg3v0': {
      'ko': '검진 결과 확인',
      'en': '',
    },
    'yxnz5in4': {
      'ko': '검진 결과를 PDF로 조회하거나 다운로드하세요.',
      'en': '',
    },
    'mo6o6smn': {
      'ko': '완료😊',
      'en': '',
    },
    'r29qmtli': {
      'ko': '준비중🕐',
      'en': '',
    },
    '1m6tkixm': {
      'ko': '다운로드',
      'en': '',
    },
    'xo6oecap': {
      'ko': ' ',
      'en': '',
    },
    'xa94oekc': {
      'ko': 'Home',
      'en': '',
    },
  },
  // resultPDF
  {
    'le8uohh1': {
      'ko': 'PDF 파일이 준비되었습니다.',
      'en': '',
    },
    '3mzwhft4': {
      'ko': '아래 버튼을 눌러 다운로드하세요.',
      'en': '',
    },
    'mg654m3c': {
      'ko': '다운로드',
      'en': '',
    },
    'oh5oxe31': {
      'ko': '암호는 생년월일 6자리 입니다.',
      'en': '',
    },
    '62isrtha': {
      'ko': 'PDF 가져오는데 실패했습니다.',
      'en': '',
    },
    'ks5jc90k': {
      'ko': '다시 시도하거나 센터에 문의하세요.',
      'en': '',
    },
    'awexvxnm': {
      'ko': 'PDF를 다운로드 중입니다.',
      'en': '',
    },
    'nu38pld2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // ParkingStatusPage
  {
    'b30mjpap': {
      'ko': '신관주차장',
      'en': '',
    },
    'ow4bcxgr': {
      'ko': '본관주차장',
      'en': '',
    },
    'j7afckxv': {
      'ko': '신관주차장',
      'en': '',
    },
    'e4p5e15r': {
      'ko': '>> 출입구',
      'en': '',
    },
    'twelwcu0': {
      'ko': '      ',
      'en': '',
    },
    'ie445kp3': {
      'ko': '대 가능',
      'en': '',
    },
    'szf1ts6t': {
      'ko': '103여대 가능',
      'en': '',
    },
    '8nlhc7ut': {
      'ko': 'Home',
      'en': '',
    },
  },
  // errorPage
  {
    'zlk27afq': {
      'ko': '올바르지 않은 접근입니다.',
      'en': '',
    },
    'yrw30sqw': {
      'ko': 'Home',
      'en': '',
    },
  },
  // keyinfoComponent
  {
    'mfk8r6zg': {
      'ko': '옷장번호',
      'en': '',
    },
    '6j2v5xti': {
      'ko': '옷을 환복하시고\n예진 1번 방으로 오세요.',
      'en': '',
    },
    'qm666tgo': {
      'ko': '옷장 키(태그)를 인식해주세요.',
      'en': '',
    },
  },
  // keyFinishComponent
  {
    'u95zwvtz': {
      'ko': '옷장번호',
      'en': '',
    },
    '5q03x6mz': {
      'ko': '옷을 환복하시고\n옷장 키(태그)를 반납하세요.',
      'en': '',
    },
  },
  // initComponent
  {
    '6i4bhjpa': {
      'ko': '건강한 삶의 동반자',
      'en': '',
    },
    '30rs0ymp': {
      'ko': '울산대학교병원 건강증진센터',
      'en': '',
    },
    'm9hvcp8j': {
      'ko': 'QR코드를 무인기에 인식해주세요.',
      'en': '',
    },
  },
  // endComponent
  {
    '45uls0mo': {
      'ko': '검진이 모두 완료되었습니다.',
      'en': '',
    },
  },
  // StratComponent
  {
    'kglt7l1i': {
      'ko': '대기 접수되었습니다.',
      'en': '',
    },
  },
  // initComponentBack
  {
    '0c7zn78h': {
      'ko': '건강한 삶의 동반자',
      'en': '',
    },
    'mt4cocrb': {
      'ko': '울산대학교병원 건강증진센터',
      'en': '',
    },
    'pliqhtuz': {
      'ko': 'ㅇㅇㅇ님 반갑습니다.😃',
      'en': '',
    },
    'hn10kk4a': {
      'ko': '⏰2024년 10월 23일',
      'en': '',
    },
    '4qnm2g03': {
      'ko': '💪행복 코스 검진입니다.',
      'en': '',
    },
    'vuvluilf': {
      'ko': '창구에서 접수를 진행하세요.',
      'en': '',
    },
  },
  // waitlistDetailComponent
  {
    'iv6c7yxq': {
      'ko': '검사명',
      'en': '',
    },
    'qlkw14q4': {
      'ko': '닫기',
      'en': '',
    },
    'wvv65fma': {
      'ko': '로딩중...',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'yd9qvdc5': {
      'ko': '',
      'en': '',
    },
    'gu70xgpr': {
      'ko': '',
      'en': '',
    },
    'j8b11w3m': {
      'ko': '',
      'en': '',
    },
    'vyjcdc55': {
      'ko': '',
      'en': '',
    },
    'ypln8okv': {
      'ko': '',
      'en': '',
    },
    'g664axkr': {
      'ko': '',
      'en': '',
    },
    'y25k143s': {
      'ko': '',
      'en': '',
    },
    '9eihwbep': {
      'ko': '',
      'en': '',
    },
    'mgafnt20': {
      'ko': '',
      'en': '',
    },
    'm7lq0lxr': {
      'ko': '',
      'en': '',
    },
    'tcyufuv0': {
      'ko': '',
      'en': '',
    },
    'ubovt5yy': {
      'ko': '',
      'en': '',
    },
    'cz7ra3g4': {
      'ko': '',
      'en': '',
    },
    'rt67dxrd': {
      'ko': '',
      'en': '',
    },
    'yifs9hw9': {
      'ko': '',
      'en': '',
    },
    'kz6819wh': {
      'ko': '',
      'en': '',
    },
    '5vj09t8e': {
      'ko': '',
      'en': '',
    },
    'x3zf3koj': {
      'ko': '',
      'en': '',
    },
    'sgvjrbww': {
      'ko': '',
      'en': '',
    },
    'hwziu4y0': {
      'ko': '',
      'en': '',
    },
    'suet1mm8': {
      'ko': '',
      'en': '',
    },
    'mfg7ygg0': {
      'ko': '',
      'en': '',
    },
    'qpy44fos': {
      'ko': '',
      'en': '',
    },
    '0aph2bj5': {
      'ko': '',
      'en': '',
    },
    'h5hip4mh': {
      'ko': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
