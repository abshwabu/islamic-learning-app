abstract final class ApiConstants {
  static const String baseUrl = 'https://api.example.com';
  static const String contentEndpoint = '/api/v1/content';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration contentSyncInterval = Duration(minutes: 30);
}
