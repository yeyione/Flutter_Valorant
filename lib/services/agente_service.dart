import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/agente.dart';

class AgenteService {
  final String _url =
      'https://valorant-api.com/v1/agents?isPlayableCharacter=true&language=es-MX';

  Future<List<Agente>> obtenerAgentes() async {
    final respuesta = await http.get(Uri.parse(_url));

    if (respuesta.statusCode == 200) {
      final datos = jsonDecode(utf8.decode(respuesta.bodyBytes));
      List<Agente> lista = [];

      for (var item in datos['data']) {
        lista.add(Agente.fromJson(item));
      }

      return lista;
    } else {
      throw Exception('Error al cargar agentes: ${respuesta.statusCode}');
    }
  }
}
