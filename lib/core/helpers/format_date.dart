import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  } catch (e) {
    return 'Invalid Date';
  }
}
