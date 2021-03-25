int getInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}

DateTime? dateTimeFromJsonFix(String dateTime) {
  if (dateTime == '') {
    return null;
  }
  var split = dateTime.split('/');
  if (split.length <= 2) {
    var month = int.parse(split[0]);
    var day = int.parse(split[1]);
    return DateTime(0, month, day);
  }
  var year = int.parse(split[0]);
  var month = int.parse(split[1]);
  var day = int.parse(split[2]);
  return DateTime(year, month, day);
}

DateTime? dateTimeFromJson(String dateTime) {
  if (dateTime == '') {
    return null;
  }
  var split = dateTime.split('/');
  if (split.length <= 2) {
    var month = int.parse(split[0]);
    var day = int.parse(split[1]);
    return DateTime(0, month, day);
  }
  var year = int.parse(split[2]);
  var month = int.parse(split[1]);
  var day = int.parse(split[0]);
  return DateTime(year, month, day);
}

String? dateTimeToJson(DateTime dateTime) {
  if (dateTime.year == 0) {
    return '${dateTime.month}/${dateTime.day}';
  }
  return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
}

String? dateTimeToJsonFixUpdate(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  if (dateTime.year == 0) {
    return '${dateTime.month}/${dateTime.day}';
  }
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

List<DateTime> dateTimeListFromJson(List<dynamic> x) {
  List<DateTime> result = [];
  for (var i in x) {
    result.add(dateTimeFromJsonFix(i as String)!);
  }
  return result;
}

List<dynamic> dateTimeListToJson(List<DateTime>? x) {
  var result = [];
  for (var i in x!) {
    result.add(dateTimeToJson(i));
  }
  return result;
}

extension DateTimeToString on DateTime {
  String? toStr() {
    return dateTimeToJson(this);
  }

  String toStrShort() {
    return '${this.day}/${this.month}';
  }

  String toStrPlus({time: false}) {
    var months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    if (!time) {
      return '${this.day} de ${months[this.month - 1]} del ${this.year}';
    }
    return '${this.hour % 12 < 10 ? '0' : ''}${this.hour % 12}:${this.minute < 10 ? '0' : ''}${this.minute} ${this.hour < 12 ? 'AM' : 'PM'} del ${this.day} de ${months[this.month - 1]} del ${this.year}';
  }
}
