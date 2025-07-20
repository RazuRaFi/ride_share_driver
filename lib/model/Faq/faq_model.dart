class FaqModel {
  final String id;
  final String category;
  final List<QuestionAndAnswer> questionAndAnswer;
  final String createdAt;
  final String updatedAt;
  final int v;

  FaqModel({
    this.id = '',
    this.category = '',
    this.questionAndAnswer = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['_id'] ?? '',
      category: json['category'] ?? '',
      questionAndAnswer: (json['questionAndAnswer'] as List<dynamic>?)
          ?.map((e) => QuestionAndAnswer.fromJson(e))
          .toList() ??
          [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'category': category,
      'questionAndAnswer':
      questionAndAnswer.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class QuestionAndAnswer {
  final String question;
  final String answer;
  final String id;

  QuestionAndAnswer({
    this.question = '',
    this.answer = '',
    this.id = '',
  });

  factory QuestionAndAnswer.fromJson(Map<String, dynamic> json) {
    return QuestionAndAnswer(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
      '_id': id,
    };
  }
}
