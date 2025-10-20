import 'package:uuid/uuid.dart';

final _uuid = Uuid();

String uuidGenerate() => _uuid.v4();
