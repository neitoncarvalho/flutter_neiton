/*
* A Classe MensagemIconeCentral  herda da  Classe StatelessWidget que é um widget
*  que não requer estado mutável, que descreve parte da interface do
* usuário ao construir uma constelação de outros widgets que descrevem
* a interface do usuário de forma mais concreta. O processo de construção
*  continua recursivamente até que a descrição da interface do usuário seja
* totalmente concreta (por exemplo, consiste inteiramente em
* RenderObjectWidget s, que descreve RenderObject s concretos ).
* */

import 'package:flutter/material.dart';

//apresentará um Container para exibir uma mensagem e ícone no centro
//MensagemIconeCentral
class MensagemIconeCentral extends StatelessWidget {
  final String mensagem;
  final IconData icone;
  final double TamanhoIcone;
  final double TamanhoFonte;

  MensagemIconeCentral(
    this.mensagem, {
    this.icone,
    this.TamanhoIcone = 70.0,
    this.TamanhoFonte = 20.0,
  });

  @override
  Widget build(BuildContext context) { // Widget build é para realizar a construação
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Icon(
              icone,
              size: TamanhoIcone,
              color: Colors.black26,
            ),
            visible: icone != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              mensagem,
              style: TextStyle(
                fontSize: TamanhoFonte,
                fontWeight: FontWeight.w500,
                color: Colors.black26,//black26
              ),
            ),
          ),
        ],
      ),
    );
  }
}
