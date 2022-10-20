import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // const msg = 'Welcome to DART_FROG';
  // return Response.json(body: msg);
  final result = await File('${Directory.current.path}/public/index.html').readAsString();
  return Response.json(body: result, headers: {'content-type': 'text/html'});
}
