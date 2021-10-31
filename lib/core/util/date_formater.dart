import 'package:intl/intl.dart';

class DateFormater{

  static String dateToDateyMMd (DateTime date, {String divisor = '-'}){
    var formater = DateFormat('y $divisor MM $divisor d'.replaceAll(' ', ''));
    return formater.format(date);
  }

  static String dateToDateyyMMdd(DateTime date, {String divisor = '-'}){
    var formater = DateFormat('yy $divisor MM $divisor dd'.replaceAll(' ', ''));
    return formater.format(date);
  }

  static String dateToDatedMMy (DateTime date, {String divisor = '/'}){
    var formater = DateFormat('d $divisor MM $divisor y'.replaceAll(' ', ''));
    return formater.format(date);
  }

}