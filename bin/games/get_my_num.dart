import 'dart:io';
import 'dart:math';

void main() {
  int numOfCards = 42;
  // List of numbers
  List<int> cards = List.generate(numOfCards, (index) => index + 1);
  String userInput;
  ({List<int> a, List<int> b, List<int> c}) sortedCards;
  late bool firstHalf = false;

  // shuffle card: this returns a scatterd deck of card
  List<int> shuffleCard(List<int> cardDeck) {
    List<int> shuffledCardList = [];

    while (shuffledCardList.length != cardDeck.length) {
      int randomNum = Random().nextInt(numOfCards) + 1;

      if (!shuffledCardList.contains(randomNum)) {
        shuffledCardList.add(randomNum);
      }
    }
    return shuffledCardList;
  }

  // check user's response to proceed
  void checkUserResponse() {
    userInput = stdin.readLineSync()!;
    if (userInput case 'y' || 'Y') {
      print("Shuffling deck...");
      cards = shuffleCard(cards);
      print('Your shuffled deck of cards: \n $cards');
    } else {
      print('Invalid response');
      // prompt user to proceed to shuffling card
      print('Have you chosen a number? (type in y to proceed to shuffling)');
      checkUserResponse();
    }
  }

  // sort card
  ({List<int> a, List<int> b, List<int> c}) shuffleToThreeDeck(
      List<int> cardDeck) {
    int counter = 0;
    List<int> a = [];
    List<int> b = [];
    List<int> c = [];

    // for (int i = 0; i < cardDeck.length; i += 3) {
    //   a.add(cardDeck[counter]);
    //   b.add(cardDeck[counter + 1]);
    //   c.add(cardDeck[counter + 2]);
    // }
    try {
      while (counter < cardDeck.length) {
        a.add(cardDeck[counter]);
        b.add(cardDeck[counter + 1]);
        c.add(cardDeck[counter + 2]);
        counter += 3;
      }
    } catch (e) {
      print("Exception: $e");
    }

    return (a: a, b: b, c: c);
  }

  // Resort card
  List<int> addCards(List<int> cards, List<int> a, List<int> b, List<int> c) {
    cards = [];
    cards.addAll(a);
    cards.addAll(b);
    cards.addAll(c);

    return cards;
  }

  void printSortedCards(({List<int> a, List<int> b, List<int> c}) sortedCards) {
    print("First Deck: ${sortedCards.a}");
    print("Second Deck: ${sortedCards.b}");
    print("Third Deck: ${sortedCards.c}");
  }

  void checkRow(
      {required String inputedValue,
      required ({List<int> a, List<int> b, List<int> c}) sortedCards}) {
    int rowNum = int.parse(inputedValue);
    switch (rowNum) {
      case 1:
        cards = addCards(cards, sortedCards.b, sortedCards.a, sortedCards.c);
      case 2:
        cards = addCards(cards, sortedCards.a, sortedCards.b, sortedCards.c);
      case 3:
        cards = addCards(cards, sortedCards.b, sortedCards.c, sortedCards.a);
      default:
        print("Invalid input");
    }
  }

  void gameTime() {
    // sort cards into three decks
    sortedCards = shuffleToThreeDeck(cards);

    // print shuffled cards
    printSortedCards(sortedCards);

    // prompt user to enter row the chosen card is in
    print('Enter the row your number is in: ');

    // get the user's input
    userInput = stdin.readLineSync()!;

    // process user's input
    checkRow(inputedValue: userInput, sortedCards: sortedCards);
  }

  // process yes or no if the number fell in the first half or not
  bool processYN() {
    userInput = stdin.readLineSync()!;
    if (userInput.toLowerCase() case 'y' || 'n') {
    } else {
      processYN();
    }
    return userInput.toLowerCase() == 'y';
  }

  int getUserNumLocation() {
    int userNumLocation = (cards.length ~/ 2);

    if (cards.length.isEven) {
      if (firstHalf) {
        return userNumLocation - 1;
      }
      return userNumLocation;
    }
    return userNumLocation;
  }

  // Start
  // print available deck of cards
  print("$cards \nPick a number in your head");

  // prompt to user to proceed to shuffling card
  print('Have you chosen a number? (type in y to proceed to shuffling)');

  // get user input and shuffle card
  checkUserResponse();

  // play the game
  for (int i = 0; i < 3; i++) {
    if (i > 0) {
      print('Reshuffling...');
    }
    gameTime();
    if (i == 0 && cards.length == 42) {
      print('was chosen number among the first 14 numbers? (y/N):');

      firstHalf = processYN();
    }
  }

  // Result
  print("Your chosen card is: ${cards[getUserNumLocation()]}");
}
