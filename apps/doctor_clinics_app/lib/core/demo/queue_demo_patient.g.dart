// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_demo_patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueueDemoPatientImpl _$$QueueDemoPatientImplFromJson(
  Map<String, dynamic> json,
) => _$QueueDemoPatientImpl(
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  appointmentType: json['appointmentType'] as String,
  isUrgent: json['isUrgent'] as bool,
  showOnHome: json['showOnHome'] as bool,
  paid: json['paid'] as bool,
  phone: json['phone'] as String?,
  fileNumber: json['fileNumber'] as String?,
  gender: json['gender'] as String?,
  examTypeKey: json['examTypeKey'] as String?,
  homeAction: json['homeAction'] as String?,
  waitMinutes: (json['waitMinutes'] as num?)?.toInt(),
  scheduledTime: json['scheduledTime'] as String?,
  paidAmountPiasters: (json['paidAmountPiasters'] as num?)?.toInt(),
  depositPiasters: (json['depositPiasters'] as num?)?.toInt(),
  cancelReason: json['cancelReason'] as String?,
  birthDate: json['birthDate'] as String?,
  phone2: json['phone2'] as String?,
  bloodType: json['bloodType'] as String?,
  lastVisitDaysAgo: (json['lastVisitDaysAgo'] as num?)?.toInt(),
  followUpInDays: (json['followUpInDays'] as num?)?.toInt(),
  debtPiasters: (json['debtPiasters'] as num?)?.toInt(),
);

Map<String, dynamic> _$$QueueDemoPatientImplToJson(
  _$QueueDemoPatientImpl instance,
) => <String, dynamic>{
  'number': instance.number,
  'name': instance.name,
  'status': instance.status,
  'appointmentType': instance.appointmentType,
  'isUrgent': instance.isUrgent,
  'showOnHome': instance.showOnHome,
  'paid': instance.paid,
  'phone': instance.phone,
  'fileNumber': instance.fileNumber,
  'gender': instance.gender,
  'examTypeKey': instance.examTypeKey,
  'homeAction': instance.homeAction,
  'waitMinutes': instance.waitMinutes,
  'scheduledTime': instance.scheduledTime,
  'paidAmountPiasters': instance.paidAmountPiasters,
  'depositPiasters': instance.depositPiasters,
  'cancelReason': instance.cancelReason,
  'birthDate': instance.birthDate,
  'phone2': instance.phone2,
  'bloodType': instance.bloodType,
  'lastVisitDaysAgo': instance.lastVisitDaysAgo,
  'followUpInDays': instance.followUpInDays,
  'debtPiasters': instance.debtPiasters,
};
