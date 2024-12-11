abstract class ApiConsumer {
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future patche(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
