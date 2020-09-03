import 'dart:convert';
//quizbairrorecife

import 'package:bairros_recife/questionario/class_questionario.dart';
import 'package:http/http.dart' as http;

/*
* Classe que vai fazer a conexão com o Json na nuvem
* */
class QuizNuvem {
  static Future<List<Questionario>> fetch() async {

    /*
    Try e catch
    Se a conexão tiver funcionado vai executar os comandos dentro do try
    caso contrário, tiver algum problema ou erro vai para o cath
    */
    try {
      //Caminho do Json que Neiton fornece os dados da nuvem Google Sheet
      var url = 'https://script.google.com/macros/s/AKfycbyFkr3hdxY-pwhdkCb5N-5yygISPwDuxVhkN-FiNsPBjU7CpM9X/exec';

      //Variável para receber o endereço vindo da API com Json
      var End_Web = await http.get(url);

      if (End_Web.statusCode == 200) {
        var dados = json.decode(End_Web.body);
        return List<Questionario>.from(
            dados["questions"].map((x) => Questionario.fromMap(x)));
      } else {
        return List<Questionario>();
      }

    } catch (error) {
      print(error);
      return List<Questionario>();
    }
  }
}
