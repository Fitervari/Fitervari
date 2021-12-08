//// Embedded Maps
/*
class Option {
  String value;
  String detail;
  bool correct;

  Option({this.correct, this.value, this.detail});
  Option.fromMap(Map data) {
    value = data['value'];
    detail = data['detail'] ?? '';
    correct = data['correct'];
  }
}
*/
class Set {
  late int completed;
  late int todo;
  late Duration? estimatedtime;
  Set({this.completed = 0, required this.todo, this.estimatedtime});

  Set.fromMap(Map data) {
    todo = data['todo'] ?? 0;
    estimatedtime = data['todo'] ?? '';
  }
}

///// Database Collections

class Exercise {
  String id;
  String title;
  String description;
  String? deviceids;
  Set? set;

  Exercise({
    required this.id,
    required this.title,
    this.description = '',
    required deviceids,
    this.set,
  });

  factory Exercise.fromMap(Map data) {
    return Exercise(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      deviceids: data['deviceids'] ?? '',
      set: data['sets'] as Set,
    );
  }
}

class Plan {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Exercise> exercises;

  Plan(
      {required this.id,
      required this.title,
      required this.description,
      this.img = 'default.png',
      required this.exercises});

  factory Plan.fromMap(Map data) {
    return Plan(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      img: data['img'] ?? 'default.png',
      exercises: (data['exercises'] as List ?? [])
          .map((v) => Exercise.fromMap(v))
          .toList(), //data['quizzes'],
    );
  }
}
/*
class Report {
  String uid;
  int total;
  dynamic topics;

  Report({this.uid, this.topics, this.total});

  factory Report.fromMap(Map data) {
    return Report(
      uid: data['uid'],
      total: data['total'] ?? 0,
      topics: data['topics'] ?? {},
    );
  }
}*/
