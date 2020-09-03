import 'package:auto_size_text/auto_size_text.dart';
import 'package:bairros_recife/componentes/CirculoAnimadoRotacaoInicial.dart';
import 'package:bairros_recife/componentes/Mensagem_Icone_Central.dart';
import 'package:bairros_recife/componentes/MensagemFinal.dart';
import 'package:bairros_recife/componentes/MensagemResultado.dart';
import 'package:bairros_recife/controla_dados_quiz/Controle_dados_das_Perguntas.dart';
import 'package:flutter/material.dart';

/*TelaUsuario é a classe que apresentar uma interface para o usuário*/

/*
Na TelaUsuario é uma classe que herda Widget StatefulWidget é um widget stateful é
um widget que descreve parte da interface do usuário, construindo uma constelação
de outros widgets que descrevem a interface do usuário de forma mais concreta.
O processo de construção continua recursivamente até que a descrição da
interface do usuário seja totalmente concreta (por exemplo, consiste inteiramente
 em RenderObjectWidget s, que descreve RenderObject s concretos ).
* */

class TelaUsuario extends StatefulWidget {

  /**
   * createState é um widget que é determinado como uma árvore local. As subclasses
   * devem substituir esse método para retornar uma instância recém-criada de
   * sua Statesubclasse associada.
   * */
  @override
  _PerguntasTelaUsuario createState() => _PerguntasTelaUsuario();
}

/**
 * State<TelaUsuario> é onde os objetos de estado são criados pela estrutura
 * chamando o método StatefulWidget.createState ao inflar um StatefulWidget para
 * inseri-lo na árvore. Como uma determinada instância de StatefulWidget pode
 * ser aumentada várias vezes.
 * */

class _PerguntasTelaUsuario extends State<TelaUsuario> {
  final _controle = Controle_dados_das_Perguntas();
  List<Widget> _MarcarPontos = []; //Lista as Widget criadas

  bool _Carregar = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controle.initialize();

    setState(() {
      _Carregar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      Tela inicial do quiz para o usuário
      */
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('QUIZ DOS BAIRROS DO RECIFE [ ${_MarcarPontos.length} de ${_controle.NumeroQuestao} ]'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _RodandodQuiz(),
        ),
      ),
    );
  }

  _RodandodQuiz() {
    if (_Carregar) return CirculoAnimadoRotacaoInicial();

    if (_controle.NumeroQuestao == 0)
      return MensagemIconeCentral(
        'Sem questões',
        icone: Icons.warning,
      );

    //Retorna as colunas dos questionários
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _Questionario(_controle.getQuestion()),
        _BotaoResposta(_controle.getAnswer1()),
        _BotaoResposta(_controle.getAnswer2()),
        _MarcadorPontuacao(),
      ],
    );
  }

  //Função para os questionários
  _Questionario(String question) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  /*Função dos boões das respostas*/
  _BotaoResposta(String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.blue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controle.RespostaCorreta(answer);

            MensagemResultado.show(
              context,
              ResultadoQuestionario: _controle.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _MarcarPontos.add(
                    Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.red,
                      //size: 20,
                    ),
                  );

                  if (_MarcarPontos.length < _controle.NumeroQuestao) {
                    _controle.ProximaQuestao();
                  } else {
                    MensagemFinal.show(
                      context,
                        totalAcerto: _controle.totalAcertos,
                        totalQuestoes:  _controle.NumeroQuestao
                    );
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  /*Função pra marcar as pontuações*/
  _MarcadorPontuacao() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _MarcarPontos,
      ),
    );
  }
}
