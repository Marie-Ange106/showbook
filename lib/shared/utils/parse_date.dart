import 'package:intl/intl.dart';

class Convertion {
  
  String dateTime(DateTime dateTime) {
    String formattedDate = DateFormat('d MMMM y, HH:mm').format(dateTime);
    return formattedDate;
  }
}
