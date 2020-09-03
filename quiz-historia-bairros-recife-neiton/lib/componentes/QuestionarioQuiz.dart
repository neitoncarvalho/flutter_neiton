import 'package:flutter/cupertino.dart';

//QuestionarioQuiz trata da estrutura dos dados utilizados pelo quiz

/*
Nesta Classe QuestionarioQuiz que herda da Classe StatelessWidget que é um
widget que não requer estado mutável inicial. Neste widget StatelessWidget
sem estado é um widget que descreve parte da interface do usuário ao construir
uma constelação de outros widgets que descrevem a interface do usuário de
forma mais concreta. O processo de construção continua recursivamente até que
a descrição da interface do usuário seja totalmente concreta.
*/

class QuestionarioQuiz extends StatelessWidget {

  final String question;

  const QuestionarioQuiz({
    Key key,
    this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { //Widget build para a construção
    return Container(
      
    );
  }
}
