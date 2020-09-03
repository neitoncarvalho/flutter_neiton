/*
* Nesta classe Questionario vai tratar de toda a estrutura dos objetos que
* foram instanciados e também utilizará o construtor por meio da palavra this.
* */

class Questionario {
  String question;
  String answer1;
  String answer2;

  //Construtor
  Questionario({this.question, this.answer1, this.answer2, });

  /**
   * Map:
   * É uma coleção de pares de chave/valor, a partir da qual
   * pode recuperar um valor usando sua chave associada.*/
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer1': answer1,
      'answer2': answer2,
    };
  }

  /**
   * fromMap é uma função para criar uma nova instância de typee
   * mapeia os dados de dataObjectdentro dela.
   * */
  static Questionario fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Questionario(
      question: map['question'],
      answer1: map['answer1'],
      answer2: map['answer2'],
    );
  }
}