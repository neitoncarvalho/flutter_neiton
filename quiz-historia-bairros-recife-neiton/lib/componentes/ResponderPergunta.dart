/*
*Nesta Classe ResponderPerguntas herda da  Classe StatelessWidget que é um widget
*  que não requer estado mutável, que descreve parte da interface do
* usuário ao construir uma constelação de outros widgets que descrevem
* a interface do usuário de forma mais concreta. O processo de construção
*  continua recursivamente até que a descrição da interface do usuário seja
* totalmente concreta (por exemplo, consiste inteiramente em
* RenderObjectWidget s, que descreve RenderObject s concretos ).
* */

import 'package:flutter/material.dart';

class ResponderPerguntas extends StatelessWidget {

  final String answer;
  final Function Toque;
  
  const ResponderPerguntas({
    Key key,
    this.answer,
    this.Toque,
  }) : super(key: key);
  
  @override

  Widget build(BuildContext context) { //Widget build para a construção do conteiner
    return Container(
      
    );
  }
}
