import 'package:dart_frog/dart_frog.dart';
import 'package:new_frog_demo_api/source/data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final request = context.request;

  switch (request.method) {
    case HttpMethod.delete:
      final dataRepository = context.read<DataSource>();
       await dataRepository.deleteFields(id);
      return Response.json(body: 'deleted successfully');
    case HttpMethod.get:
      final dataRepository = context.read<DataSource>();
      final categories = await dataRepository.getFields(id);
      return Response.json(body: categories);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
    case HttpMethod.put:
      return Response.json(body: 'successfully');
  }
}
