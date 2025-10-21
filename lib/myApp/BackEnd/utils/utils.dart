import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

String uuidGenerate() => _uuid.v4();

String dateFormat(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}
