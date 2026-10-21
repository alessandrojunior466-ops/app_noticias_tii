import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/noticia.dart'; // Certifique-se que o caminho aponta para o seu arquivo noticia.dart

class NoticiaService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  Future<List<Noticia>> getNoticia() async {
    final resposta = await http.get(Uri.parse('$baseUrl/noticia'));

    if (resposta.statusCode == 200) {
      final List dados = jsonDecode(resposta.body);
      return dados.map((item) => Noticia.fromJson(item)).toList();
    } else {
      throw Exception('Não foi possível carregar as Notícias');
    }
  }
}
