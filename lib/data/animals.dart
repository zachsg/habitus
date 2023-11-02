import 'dart:math';

class Animals {
  static const all = [
    'Badgers',
    'Bears',
    'Beavers',
    'Cats',
    'Chipmunks',
    'Cows',
    'Crows',
    'Dogs',
    'Dolphins',
    'Doves',
    'Ducks',
    'Eagles',
    'Elephants',
    'Falcons',
    'Geckos',
    'Gerbils',
    'Giraffes',
    'Hawks',
    'Hippos',
    'Horses',
    'Hummingbirds',
    'Jaguars',
    'Koalas',
    'Lambs',
    'Leopards',
    'Lions',
    'Magpies',
    'Mice',
    'Mustangs',
    'Owls',
    'Pandas',
    'Pumas',
    'Quails',
    'Ravens',
    'Sheep',
    'Snakes',
    'Sparrows',
    'Squirrels',
    'Swans',
    'Tigers',
    'Turtles',
    'Whales',
  ];

  static List<String> like(String search) {
    final likes = all
        .where((animal) => animal.toLowerCase().contains(search.toLowerCase()))
        .toList();
    return likes;
  }

  static String random() {
    final random = Random();
    return all[random.nextInt(all.length)];
  }
}
