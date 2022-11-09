import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealsModel {
  List<Result>? result;

  MealsModel({this.result});

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return _$MealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsToJson(this);
  }
}

@JsonSerializable()
class Result {
  String? stdLaunch;
  String? empLaunc;
  String? dinner;
  String? date;

  Result({this.stdLaunch, this.empLaunc, this.dinner, this.date});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResultToJson(this);
  }
}
