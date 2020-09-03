/*
Nesta Classe CirculoAnimadoRotacaoInicial  apresentará um Container para exibir
um circulo animado que indica o progresso do carregamento.
Para isso será utilizado o widget CircularProgress que herda da Classe
StatelessWidget que é um widget que não requer estado mutável.

Neste widget StatelessWidget sem estado é um widget que descreve parte da
interface do usuário ao construir uma constelação de outros widgets que
descrevem a interface do usuário de forma mais concreta. O processo de
construção continua recursivamente até que a descrição da interface do usuário
 seja totalmente concreta.
*/

import 'package:flutter/material.dart';
class CirculoAnimadoRotacaoInicial extends StatelessWidget {
  final String mensagem;
  final double CarregadoTamanho;
  final double TamanhoFonte;

  CirculoAnimadoRotacaoInicial({
    this.mensagem = 'Carregando',
    this.CarregadoTamanho = 70.0,
    this.TamanhoFonte = 18.0,
  });

  @override
  Widget build(BuildContext context) { // Widget build é para realizar a construação
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: CarregadoTamanho,
            width: CarregadoTamanho,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              mensagem,
              style: TextStyle(
                  color: Colors.white30,
                  fontSize: TamanhoFonte,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
