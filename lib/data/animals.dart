class Animals {
  static const all = [
    'Bears',
    'Beavers',
    'Blue Jays',
    'Cats',
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
    'Giraffes',
    'Hawks',
    'Hippos',
    'Horses',
    'Hummingbirds',
    'Jaguars',
    'Koalas',
    'Lambs',
    'Magpies',
    'Mice',
    'Mustangs',
    'Owls',
    'Pandas',
    'Quails',
    'Ravens',
    'Sheep',
    'Snakes',
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
}
