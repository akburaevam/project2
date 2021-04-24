import 'dart:io';
import 'dart:math';

void main() {
  GuessNumber guessNumber = new GuessNumber();
  print(guessNumber.searchNum());
}

class GuessNumber {
  String message = 'Enter yout number';

  static Random random = new Random();
  static int randomNumber = random.nextInt(100) + 1;

  searchNum() {
    print(message);

    Utils.readInput();
    int num = Utils.getNum();

    if (randomNumber == num) {
      print('yes');
    } else if (randomNumber < num) {
      print('less');
    } else if (randomNumber > num) {
      print('greater');
    }
    return searchNum();
  }
}

class Utils {
  static int _num = 0;

  static void readInput() {
    _num = int.parse(stdin.readLineSync()!);
    if (_num < 1 && _num > 100) {
      throw new Exception('Wrong num + $_num');
    }
  }

  static getNum() {
    return _num;
  }
}
