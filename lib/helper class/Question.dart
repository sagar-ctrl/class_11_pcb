/// title : "Question: 175   The M.K.S unit of energy is "
/// answer1 : "Dyne/sec"
/// answer2 : "Joule"
/// answer3 : "erg"
/// answer4 : "none of these "
/// answer : " B        \r\n    \r\n    "
/// subject : "physics"
/// id : 5

class Question {
  String title;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String answer;
  String subject;
  int id;

  static Question fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Question questionBean = Question();
    questionBean.title = map['title'];
    questionBean.answer1 = map['answer1'];
    questionBean.answer2 = map['answer2'];
    questionBean.answer3 = map['answer3'];
    questionBean.answer4 = map['answer4'];
    questionBean.answer = map['answer'];
    questionBean.subject = map['subject'];
    questionBean.id = map['id'];
    return questionBean;
  }

  Map toJson() => {
    "title": title,
    "answer1": answer1,
    "answer2": answer2,
    "answer3": answer3,
    "answer4": answer4,
    "answer": answer,
    "subject": subject,
    "id": id,
  };
}