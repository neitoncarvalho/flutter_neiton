import 'dart:math';

import 'package:bairros_recife/questionario/class_questionario.dart';
import 'package:bairros_recife/nuvem/quiz_nuvem.dart';

/**
* A classe Controle_dados_das_Perguntas é onde vai Controlar dados referente
 * as Perguntas do Quiz
* */

class Controle_dados_das_Perguntas {
  List<Questionario> _bdQuestao; //Lista todos os dados com comando List

  Random _random = new Random(); //Criação do objeto random da classe Random
  /*
  Criação das variáveis para tratar o indice da questão, mudar a resposta,
  número da questão e o  Total de acertos
  */
  int IndiceQuestao = 0;
  bool _MudarResposta;
  int totalAcertos = 0;
  int get NumeroQuestao => _bdQuestao?.length ?? 0;
  Questionario get question => _bdQuestao[IndiceQuestao];

  //Função para a inicialização
  Future<void> initialize() async {
    IndiceQuestao = 0;
    totalAcertos = 0;
    _bdQuestao = await QuizNuvem.fetch();
    print('Numero das questões: ${_bdQuestao.length}');
    _bdQuestao.shuffle();
    _MudarResposta = _random.nextBool();
  }

  //Procedimento para a primeira questão
  void ProximaQuestao() {
    IndiceQuestao = ++IndiceQuestao % _bdQuestao.length;
    _MudarResposta = _random.nextBool();
  }

  //Buscar a questão
  String getQuestion() {
    return _bdQuestao[IndiceQuestao].question;
  }

  //Buscas a Resposta 1
  String getAnswer1() {
    return _MudarResposta
        ? _bdQuestao[IndiceQuestao].answer1
        : _bdQuestao[IndiceQuestao].answer2;
  }

  //Buscas a Resposta 2
  String getAnswer2() {
    return _MudarResposta
        ? _bdQuestao[IndiceQuestao].answer2
        : _bdQuestao[IndiceQuestao].answer1;
  }

  //Função para verificar se a questão está correta
  bool RespostaCorreta(String answer) {
    var correta = _bdQuestao[IndiceQuestao].answer1 == answer;
    totalAcertos = totalAcertos + (correta ? 1 : 0);
    return correta;
  }
}
