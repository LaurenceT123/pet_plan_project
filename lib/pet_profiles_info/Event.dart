
class Event
{
  final String name;
  final int beginTime;
  final int endTime;
  final String description;
  final bool notification;

  const Event({
    required this.name,
    required this.beginTime,
    required this.endTime,
    required this.description,
    required this.notification,
  });

}