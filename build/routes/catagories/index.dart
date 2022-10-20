import 'dart:math';

import 'package:dart_frog/dart_frog.dart';
import 'package:new_frog_demo_api/source/data_source.dart';

// we will create a request to read our dataSource
Future<Response> onRequest(RequestContext context) async {
  // reading the context of our dataSource
  final dataRepository = context.read<DataSource>();
  final request = context.request;
  const categories = 'Hello';
  switch (request.method) {
    case HttpMethod.delete:
      var msg = 'Please enter Id you want to delete';
      return Response.json(body: {'error': msg});
      break;
    case HttpMethod.head:
      return Response.json(body: {'message': 'Method not found'});
      break;
    case HttpMethod.options:
      return Response.json(body: {'message': 'Method not found'});
      break;
    case HttpMethod.patch:
      return Response.json(body: {'message': 'Method not found'});
      break;
    case HttpMethod.post:
      List keys = [];
      List values = [];
      final data = await context.request.json();
      data.forEach((key, value) {
        keys.add(key);
        values.add(value);
      });
      final result = await dataRepository.insertCategory(keys,values);
      return Response.json(body: {'message' : result});
      break;
    case HttpMethod.put:
      var msg = 'Please enter Id you want to update';
      return Response.json(body: {'error': msg});
      break;
    case HttpMethod.get:
      final category = await dataRepository.fetchCategories();
      return Response.json(body: {'data': category});
      break;
  }
  // print(Uri.base.toString()); // http://localhost:8082/game.html?id=15&randomNumber=3.14
  // print(Uri.base.query);  // id=15&randomNumber=3.14
  // print(Uri.base.queryParameters['randomNumber']);
  // String catId = UriData.fromUri(id) as String;
  // based on that we will await and fetch the fields from our database
  // final categories = await dataRepository.fetchCategory(catId);
  // than we will return the response as JSON
}

