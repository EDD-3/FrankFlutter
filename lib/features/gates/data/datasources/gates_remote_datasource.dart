import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/features/gates/data/models/gate_model.dart';

abstract class GateRemoteDatasource {
  Future<List<GateModel>> getGatesList();
}

class GateRemoteDatasourceImp implements GateRemoteDatasource {
  final http.Client client;

  GateRemoteDatasourceImp({
    @required this.client,
  });

  @override
  Future<List<GateModel>> getGatesList() async {
    final url = 'http://atencion.nogalessonora.gob.mx/api/bwt';
    final response = await client.get(url);
    switch (response.statusCode) {
      case 200:
        final result = jsonDecode(response.body);
        final Iterable list = result;
        return list.map((model) => GateModel.fromJson(model)).toList();
      default:
        throw ServerException(
            code: response.statusCode, message: response.reasonPhrase);
    }
  }
}
