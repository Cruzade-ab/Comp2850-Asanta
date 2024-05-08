import 'package:hive/hive.dart';
part 'event.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String note;
  Event({required this.name, required this.date, required this.note});
}
