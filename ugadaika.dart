import 'dart:io';

void main() {
  GuessNumber guessNumber = new GuessNumber(1000);
  print(guessNumber.search());
}

class GuessNumber {
  static List<String> commands = ['less', 'greater', 'yes', 'no'];
  static int count = 0;
  List<int> nums = [];

  GuessNumber(int size) {
    //var myList = List.generate(5, (index) => index * 2);
    nums = List.generate(size, (index) => index + 1);
    for (int i = 0; i < size; i++) {
      nums[i] = i + 1;
    }
  }

  search() {
    int start = 0;
    int end = nums.length - 1;
    int mid = (end / 2).floor();
    //print('Start is $start' + ' End is $end' +' Mid is $mid');
    return binarySearch(start, mid, end);
  }

  binarySearch(int start, int mid, int end) {
    count++;

    print("It is " + nums[mid].toString() + " ?");
    Utils.readInput();

    String command = Utils.getCommand();

    if (command == 'less') {
      return binarySearch(start, (((mid - 1) + start) / 2).floor(), mid - 1);
    } else if (command == 'greater') {
      return binarySearch(mid + 1, ((mid + 1 + end)/2).floor(), end);
    } else {
      return count;
    }
  }
}

class Utils {
  static String _command = '';

  static void readInput() {
    _command = stdin.readLineSync()!;
    if (!GuessNumber.commands.contains(_command)) {
      throw new Exception('Wrong command' + _command);
    }
  }

  static getCommand() {
    return _command;
  }
}
