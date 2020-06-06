import 'package:fundmf/utils/log_helper.dart';

class Helper {
  String capitalize(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  String getInitials(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    var inpArr = input.split(' ');
    String initials = '';
    for (var word in inpArr) {
      LoggingHelper.logger.d('word is $word');
      if (word.length > 0) {
        initials += capitalize(word[0]);
      }
    }
    return initials;
  }
}
