enum Gender { Male, Female }

void main() {
  // The Fiscal Code
  Map monthsCode = {
    1: 'A',
    2: 'B',
    3: 'C',
    4: 'D',
    5: 'E',
    6: 'H',
    7: 'L',
    8: 'M',
    9: 'P',
    10: 'R',
    11: 'S',
    12: 'T'
  };
  List vowels = ['a', 'e', 'i', 'o', 'u'];

  List consonant = [
    'b',
    'c',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  List numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  bool isDigit({required String letter}) {
    if (numbers.contains(letter)) {
      return true;
    }
    return false;
  }

  bool isConsonant(String letter) {
    if (consonant.contains(letter.toLowerCase())) {
      return true;
    }
    return false;
  }

  bool isVowel(String letter) {
    if (vowels.contains(letter)) {
      return true;
    }
    return false;
  }

  String tempHolder = '';
  String letter;
  String finalCode = '';

  void setSurname({required String surname}) {
    int counter = 0;
    tempHolder = '';
    // surname
    if (surname.length >= 3) {
      for (int i = 0; i < surname.length; i++) {
        letter = surname.substring(i, i + 1);
        if (isConsonant(letter) == true && counter < 3) {
          tempHolder = tempHolder + letter.toUpperCase();
          counter++;
        }
      }
      if (counter != 3 && surname.length >= 3) {
        for (int i = 0; i < surname.length; i++) {
          letter = surname.substring(i, i + 1);
          if (isVowel(letter) == true && counter < 3) {
            tempHolder = tempHolder + letter.toUpperCase();
            counter++;
          }
        }
      }
    } else if (surname.length == 2) {
      for (int i = 0; i < surname.length; i++) {
        letter = surname.substring(i, i + 1);
        if (isConsonant(letter) == true && counter < 3) {
          tempHolder = tempHolder + letter.toUpperCase();
          counter++;
        }
      }
      for (int i = 0; i < surname.length; i++) {
        letter = surname.substring(i, i + 1);
        if (isVowel(letter) == true && counter < 3) {
          tempHolder = tempHolder + letter.toUpperCase();
          counter++;
        }
      }
      if (tempHolder.length == 2) {
        tempHolder = '${tempHolder}X';
        counter++;
      }
      // print('tempHolder: $tempHolder');
    }
    finalCode += tempHolder;
  } // end og surname function

  // set name function
  void setName({required String name}) {
    int counter = 0;
    tempHolder = '';
    int consonantCounter = 0;
    // name
    // check if there are exactly 3 consonant
    for (int i = 0; i < name.length; i++) {
      letter = name.substring(i, i + 1);
      if (isConsonant(letter)) {
        consonantCounter++;
      }
    }
    if (name.length >= 3 && consonantCounter == 3) {
      setSurname(surname: name);
      tempHolder = '';
    } else if (name.length >= 3 && consonantCounter > 3) {
      // consonant search
      for (int i = 0; i < name.length; i++) {
        letter = name.substring(i, i + 1);
        if (isConsonant(letter) == true && counter <= 3) {
          if (counter != 1) {
            tempHolder = tempHolder + letter.toUpperCase();
          }

          counter++;
        }
      }
      if (counter != 3 && name.length >= 3) {
        for (int i = 0; i < name.length; i++) {
          letter = name.substring(i, i + 1);
          if (isVowel(letter) == true && counter < 3) {
            tempHolder = tempHolder + letter.toUpperCase();
            counter++;
          }
        }
      }
    } else if (name.length == 2) {
      for (int i = 0; i < name.length; i++) {
        letter = name.substring(i, i + 1);
        if (isConsonant(letter) == true && counter < 3) {
          tempHolder = tempHolder + letter.toUpperCase();
          counter++;
        }
      }
      for (int i = 0; i < name.length; i++) {
        letter = name.substring(i, i + 1);
        if (isVowel(letter) == true && counter < 3) {
          tempHolder = tempHolder + letter.toUpperCase();
          counter++;
        }
      }
      if (tempHolder.length == 2) {
        tempHolder = '${tempHolder}X';
        counter++;
      }
      // print('tempHolder: $tempHolder');
    }
    finalCode += tempHolder;
  } // end of name function

  void lastFiveDigit({required String gender, required String dob}) {
    // get the last 2 digits of the birth year
    tempHolder = dob.substring(dob.length - 2, dob.length);

    finalCode += tempHolder;
    // dob = dob.replaceRange(dob.length - 5, dob.length, '');
    dob = dob = dob.substring(0, dob.length - 4);
    // print('dob: $dob');

    String day = '';
    String month = '';
    int monthNum = 0;
    int dayNum = 0;

    // get the month and day digits
    for (int i = 0; i < dob.length; i++) {
      letter = dob.substring(i, i + 1);
      if (isDigit(letter: letter) && i < 2) {
        day += letter;
      } else if (isDigit(letter: letter) && i >= 2) {
        month += letter;
      }
    }
    // convert the day and month to int
    dayNum = int.parse(day);
    monthNum = int.parse(month);

    // check if month is a valid month
    if (monthNum > 0 && monthNum <= 12) {
      month = monthsCode[monthNum];
      finalCode += month;
    } else {
      print('$month is not a valid month');
    }

    // check gender
    if (dayNum > 0 && dayNum <= 31) {
      if (gender.toLowerCase() == 'm') {
        if (dayNum < 10) {
          day = '0$day';
          finalCode += day;
        } else {
          finalCode += day;
        }
      } else if (gender.toLowerCase() == 'f') {
        dayNum += 40;
        finalCode += dayNum.toString();
      } else {
        print('$gender is an invalid gender type in \'m\' or \'f\'');
      }
    }
    // print(day);
    // print(month);
    // print(dob);
    // print('year last two diigits: $tempHolder');
  }

  void fiscalCode({
    required String name,
    required String surname,
    required String gender,
    required String dob,
  }) {
    finalCode = '';
    setSurname(surname: surname);
    setName(name: name);
    lastFiveDigit(gender: gender, dob: dob);
    // name

    // print('tempHolder: $tempHolder');
    if (finalCode.length == 11) {
      print('Fiscal code: $finalCode');
    }
  }

  // when filling the gender answer 'M' or 'F'
  // when filling the date of birth fill in this order day/month/year e.g 1/1/1998
  fiscalCode(
      name: 'Nyerovwo', surname: 'Akpojiyovwi', gender: 'm', dob: '6/10/2345');
  fiscalCode(name: 'Matt', surname: 'Edabit', gender: 'm', dob: '1/1/1900');
  fiscalCode(name: 'Helen', surname: 'Yu', gender: 'f', dob: '1/12/1950');
  fiscalCode(name: 'Mickey', surname: 'Mouse', gender: 'm', dob: '16/1/1928');
  fiscalCode(name: 'Daniel', surname: 'Ugbewho', gender: 'm', dob: '22/7/2008');
}
