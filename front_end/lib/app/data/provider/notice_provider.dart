import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/notice_wrapper.dart';

class NoticeProvider {
  final String _apiPandoraNoticeUrl =
      dotenv.env['API_PANDORA_NOTICE_URL']!;
  final String _apiPandoraKey = dotenv.env['API_PANDORA_KEY']!;
  final http.Client httpClient;
  final _logger = Logger();

  NoticeProvider({required this.httpClient});

  Future<NoticeWrapper> getNotices(
    String search,
    String hl,
    String gl,
    String ceid,
  ) async {

    final String apiUrl = '$_apiPandoraNoticeUrl?'
        'Search=$search&'
        'HL=$hl&'
        'GL=$gl&'
        'CEID=$ceid&'
        'Token=$_apiPandoraKey';
    try {
      var response = await httpClient.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        _logInfo("Successfully fetched notice from API.");
        return NoticeWrapper.fromJson(jsonDecode(response.body));
      } else {
        _handleError(response.statusCode);
      }
    } catch (error) {
      _handleError(error.toString());
    }

    throw Exception('error_load_data'.tr);
  }

  void _handleError(dynamic error) {
    _logger.e("NoticeProvider Error", error: error);
    throw Exception('error_load_data'.tr);
  }

  void _logInfo(String message) {
    _logger.i("NoticeProvider: $message");
  }
}
