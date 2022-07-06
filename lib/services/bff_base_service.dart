import 'dart:convert';

import 'package:http/http.dart' as http;

class MsCommunicationDto {
  String path;
  Map<String, dynamic>? body;
  String? token;

  MsCommunicationDto({
    required this.path,
    this.body,
    this.token,
  });
}

class BffBaseService {
  static const String _baseUrl = 'http://10.3.20.156:5002/api/thor-bff/';

  static dynamic Get(MsCommunicationDto dto) {
    var path = dto.path;
    var url = BffBaseService._GetUrl(path);
    return url;
  }

  static dynamic Post(MsCommunicationDto dto) async {
    var path = dto.path;
    var url = BffBaseService._GetUrl(path);
    var headers = BffBaseService._GetHeaders(dto.token);
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: dto.body != null ? jsonEncode(dto.body) : null,
    );
    var body = jsonDecode(response.body);
    return body['data'];
  }

  static String _GetUrl(String path) {
    return '${BffBaseService._baseUrl}${path}';
  }

  static Map<String, String> _GetHeaders(String? token) {
    var headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidGVzdCIsImVtYWlsIjoidGVzdEBza2x1bS5jb20iLCJ1c2VySWQiOiI0Nzg3MGY1My1kNGM4LTQxNGEtYWVlZS0xZjM5M2QxYzQ5ZTEiLCJpYXQiOjE2NTUyMDU0NjYsImV4cCI6ODY0MDE2NTUyMDU0NjZ9.BZh2EIFEVJ7w-SDs423H_fOx3rolFBqZPDSWJHYznWs';
    return headers;
  }
}
