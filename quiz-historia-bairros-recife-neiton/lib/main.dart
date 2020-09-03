import 'package:bairros_recife/tela/TelaUsuario.dart';
import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativoQuizBairrosRecife());

/*
A classe MeuAplicativoQuiz herda o widget inicial que é o StatelessWidget
para o estado inicial o aplicativo
*/

class MeuAplicativoQuizBairrosRecife extends StatelessWidget {
  @override
  Widget build(BuildContext context) {//build é widget que é uma ferramenta para construir o app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz da história dos Bairros do Recife',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: TelaUsuario(),//Classe que vai apresentar a tela ao usuário
    );
  }
}