import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  static final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:5000';
}
