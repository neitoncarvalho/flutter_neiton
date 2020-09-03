import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bairros_recife/tela/TelaUsuario.dart';
import 'package:share/share.dart';

//É uma classe MensagemFinal que é um AlertDialog para o placar final do Quiz
class MensagemFinal {
  static Future show(
    BuildContext texto, {
    @required int totalAcerto,
    @required int totalQuestoes,
  }) {
    return showDialog<void>( //Mensagem de texto
      context: texto,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.limeAccent,
            maxRadius: 35.0,
            child: Icon(
              totalAcerto < 6 ? Icons.warning : Icons.favorite,
              color: Colors.indigo,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Parabéns',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Você acertou $totalAcerto de $totalQuestoes!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
              Text(
                'Quer tentar novamente? Talvez acerte todas as perguntas na próxima vez!',
                style: TextStyle(
                  color: Colors.yellowAccent,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('COMPARTILHAR'),
              onPressed: () {
                Share.share('QUIZ DOS BAIRROS DO RECIFE. Você acertou $totalAcerto de $totalQuestoes!');
              },
            ),
            FlatButton(
              child: const Text('RESPONDER NOVAMENTE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaUsuario()),
                );
              },
            ),
            FlatButton(
              child: const Text('SAIR'),
              onPressed: () {
                SystemNavigator.pop();
              },
            )
          ],
        );
      },
    );
  }
}
