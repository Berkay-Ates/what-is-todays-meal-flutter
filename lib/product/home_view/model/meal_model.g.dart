// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsModel _$MealsFromJson(Map<String, dynamic> json) => MealsModel(
      result: (json['result'] as List<dynamic>?)?.map((e) => Result.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$MealsToJson(MealsModel instance) => <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      stdLaunch: json['stdLaunch'] as String?,
      empLaunc: json['empLaunc'] as String?,
      dinner: json['dinner'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'stdLaunch': instance.stdLaunch,
      'empLaunc': instance.empLaunc,
      'dinner': instance.dinner,
      'date': instance.date,
    };
