class NumbersModel {
  final List<double> numbers;

  NumbersModel(this.numbers);

  int get zeros {
    int count = 0;
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] == 0) {
        count++;
      }
    }
    return count;
  }

  int get negatives {
    int count = 0;
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] < 0) {
        count++;
      }
    }
    return count;
  }

  int get positives {
    int count = 0;
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] > 0) {
        count++;
      }
    }
    return count;
  }
}
