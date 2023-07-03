class Event
{
  String title;
  String description;
  DateTime startTime;
  DateTime endTime;
  bool repeat;

  Event(
      {
        required this.title,
        required this.description,
        required this.startTime,
        required this.endTime,
        this.repeat = false,
      });

  String getTitle()
  {
    return title;
  }

  String getDescription()
  {
    return description;
  }

  DateTime getStartTime()
  {
    return startTime;
  }

  DateTime getEndTime()
  {
    return endTime;
  }
}