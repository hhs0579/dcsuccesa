import '../../utils/toast.dart';

class PossibleEmailText {
  bool isEmail;
  PossibleEmailText({
    this.isEmail = false,
  });
}

PossibleEmailText checkEmailText(String value) {
  var checkEmailText = PossibleEmailText();
  final validEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (validEmail.hasMatch(value)) {
    checkEmailText.isEmail = true;
  } else {
    checkEmailText.isEmail = false;
  }
  return checkEmailText;
}

vaildationemail(String value) {
  var vaildationemail = checkEmailText(value);

  if (value.isEmpty) {
    return toastMessage("이메일을 작성해주세요");
  } else {
    if (vaildationemail.isEmail == false) {
      return toastMessage("잘못된 이메일 형식입니다.");
    } else {
      return null;
    }
  }
}

class PossibleNameText {
  bool isCharacters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossibleNameText(
      {this.isCharacters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
}

PossibleNameText checkNameText(String value) {
  var possibleNameText = PossibleNameText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length >= 2 && value.length <= 7) {
    possibleNameText.isCharacters = true;
  } else {
    possibleNameText.isCharacters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possibleNameText.is1Symbol = true;
  } else {
    possibleNameText.is1Symbol = false;
  }

  if (!validAlphabet.hasMatch(value)) {
    possibleNameText.is1Letter = true;
  } else {
    possibleNameText.is1Letter = false;
  }

  if (!validNumbers.hasMatch(value)) {
    possibleNameText.is1Number = true;
  } else {
    possibleNameText.is1Number = false;
  }
  return possibleNameText;
}

vaildationname(String value) {
  var vaildationname = checkNameText(value);
  if (value.isEmpty) {
    return toastMessage("이름을 작성해주세요");
  } else {
    if (vaildationname.isCharacters == false) {
      return toastMessage("이름은 2~5자 사이로 입력해주세요.");
    } else if (vaildationname.is1Number == false ||
        vaildationname.is1Letter == false ||
        vaildationname.is1Symbol == false) {
      return toastMessage("실명을 입력해주세요.");
    } else {
      return null;
    }
  }
}

class PossiblePasswordText {
  bool is8Characters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossiblePasswordText(
      {this.is8Characters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
}

PossiblePasswordText checkPasswordText(String value) {
  var possiblePasswordText = PossiblePasswordText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  if (value.length >= 8 && value.length <= 12) {
    possiblePasswordText.is8Characters = true;
  } else {
    possiblePasswordText.is8Characters = false;
  }

  if (validSpecial.hasMatch(value)) {
    possiblePasswordText.is1Symbol = true;
  } else {
    possiblePasswordText.is1Symbol = false;
  }

  if (validAlphabet.hasMatch(value)) {
    possiblePasswordText.is1Letter = true;
  } else {
    possiblePasswordText.is1Letter = false;
  }

  if (validNumbers.hasMatch(value)) {
    possiblePasswordText.is1Number = true;
  } else {
    possiblePasswordText.is1Number = false;
  }
  return possiblePasswordText;
}

vaildationpassword(String value) {
  var vaildationpassword = checkPasswordText(value);

  if (value.isEmpty) {
    return toastMessage("비밀번호를 작성해주세요");
  } else {
    if (vaildationpassword.is8Characters == false) {
      return toastMessage("8~12자 비밀번호를 설정해주세요.");
    } else if (vaildationpassword.is1Number == false ||
        vaildationpassword.is1Letter == false ||
        vaildationpassword.is1Symbol == false) {
      return toastMessage("비밀번호에 숫자, 문자, 특수문자는 필수입니다.");
    } else {
      return null;
    }
  }
}

class PossiblePhoneNumber {
  bool is11Characters;
  bool is1Symbol;
  PossiblePhoneNumber({this.is11Characters = false, this.is1Symbol = false});
}

PossiblePhoneNumber checkPhoneNumberText(String value) {
  var possiblePhoneNumber = PossiblePhoneNumber();
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length == 11) {
    possiblePhoneNumber.is11Characters = true;
  } else {
    possiblePhoneNumber.is11Characters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possiblePhoneNumber.is1Symbol = true;
  } else {
    possiblePhoneNumber.is1Symbol = false;
  }

  return possiblePhoneNumber;
}

vaildationPhoneNumber(String value) {
  var vaildationPhoneNumber = checkPhoneNumberText(value);

  if (value.isEmpty) {
    return toastMessage("전화번호를 입력해주세요.");
  } else {
    if (vaildationPhoneNumber.is11Characters == false) {
      return toastMessage("전화번호를 11자리를 입력해주세요.");
    } else {
      if (vaildationPhoneNumber.is1Symbol == false) {
        return toastMessage("특수문자없이 숫자만 입력해주세요.");
      } else {
        return null;
      }
    }
  }
}

class PossibleClubNameText {
  bool isCharacters;
  bool is1Symbol;
  bool is1Number;
  PossibleClubNameText(
      {this.isCharacters = false,
      this.is1Symbol = false,
      this.is1Number = false});
}

PossibleNameText checkClubNameText(String value) {
  var possibleclubNameText = PossibleNameText();
  final validNumbers = RegExp(r'(\d+)');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length > 2) {
    possibleclubNameText.isCharacters = true;
  } else {
    possibleclubNameText.isCharacters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possibleclubNameText.is1Symbol = true;
  } else {
    possibleclubNameText.is1Symbol = false;
  }

  if (!validNumbers.hasMatch(value)) {
    possibleclubNameText.is1Number = true;
  } else {
    possibleclubNameText.is1Number = false;
  }
  return possibleclubNameText;
}

vaildationClubname(String value) {
  var vaildationclubname = checkClubNameText(value);

  if (vaildationclubname.isCharacters == false) {
    return toastMessage('2글자 이상 입력해주세요.');
  } else {
    if (vaildationclubname.is1Symbol == false) {
      return toastMessage('특수문자는 입력할 수 없습니다.');
    } else {
      if (vaildationclubname.is1Number == false) {
        return toastMessage('숫자는 입력할 수 없습니다.');
      } else {
        return null;
      }
    }
  }
}
