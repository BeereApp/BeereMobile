import 'dart:convert';

List<StateModel> stateModelFromMap(String str) =>
    List<StateModel>.from(json.decode(str).map((x) => StateModel.fromMap(x)));

class StateModel { 
  StateModel({
    required this.state,
  });

  final States state;

  factory StateModel.fromMap(Map<String, dynamic> json) => StateModel(
        state: States.fromMap(json["states"]),
      );
}

class States {
  States({
    required this.name,
    required this.id,
    required this.locals,
  });

  final String name;
  final int id;
  final List<Local> locals;

  factory States.fromMap(Map<String, dynamic> json) => States(
        name: json["name"],
        id: json["id"],
        locals: List<Local>.from(json["locals"].map((x) => Local.fromMap(x))),
      );
}

class Local {
  Local({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory Local.fromMap(Map<String, dynamic> json) => Local(
        name: json["name"],
        id: json["id"],
      );
}
