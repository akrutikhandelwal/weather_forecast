

import 'package:intl/intl.dart';

class Util
{
  static String appId ="f5cf30bb885f1923350bbe3be8230e2a";

  static String getFormattedDate(DateTime dateTime)
  {
    return new DateFormat('EEEE, MMM d, yyy').format(dateTime);
  }

}