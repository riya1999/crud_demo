import 'package:dart_frog/dart_frog.dart';

// we will create a request to read our dataSource
Future<Response> onRequest(RequestContext context) async {
  // than we will return the response as JSON
  const msg='Hello World';
  return Response.json(body: msg);
}
