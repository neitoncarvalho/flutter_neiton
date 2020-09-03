import 'package:flutter/material.dart';
import 'package:bairros_recife/questionario/class_questionario.dart';

//MensagemResultado apresentará um AlertDialog com o resultado da resposta do jogador ao clicar no botão de resposta

class MensagemResultado {
  static Future show(
    BuildContext Texto, {
    @required Questionario ResultadoQuestionario,
    @required bool correct,
    @required Function onNext,
  }) {
    return showDialog<void>(
      context: Texto,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: correct ? Colors.green : Colors.red,
            child: Icon(
              correct ? Icons.check : Icons.close,
              color: Colors.yellow,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ResultadoQuestionario.question,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                correct ? 'Você acertou!' : 'Você errou! O correto é:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: correct ? Colors.green : Colors.yellow,
                ),
              ),
              Text(
                ResultadoQuestionario.answer1,
                style: TextStyle(
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('PRÓXIMA PERGUNTA'),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              //  color: Colors.amberAccent;
              },
            )
          ],
        );
      },
    );
  }
}
