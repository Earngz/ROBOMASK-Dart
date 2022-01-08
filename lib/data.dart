class Coin {
  String image, name, id, volume;
  double price, total, change, mcap, cs;
  List<double> data;

  Coin(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.total,
      required this.data,
      required this.change,
      required this.mcap,
      required this.cs,
      required this.volume});
}

List<Coin> coins = [
  Coin(
      id: 'BTC',
      name: "Bitcoin",
      price: 54931.51,
      total: 0.015,
      change: 2.2,
      volume: '206.35',
      mcap: 1032080056444,
      cs: 18836593,
      data: [1, 10, 7, 4, 8, 6, 2, 3, 6, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png'),
  Coin(
      id: 'ETH',
      name: "Ethereum",
      price: 3592.54,
      total: 0.35,
      change: 2.7,
      volume: '2.1K',
      mcap: 406947666374,
      cs: 117819373,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png'),
  Coin(
      id: 'BNB',
      name: "Binance",
      price: 436.61,
      total: 12.07,
      change: 1.2,
      volume: '6.6K',
      mcap: 76852380369,
      cs: 168137036,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1839.png'),
  Coin(
      id: 'ADA',
      name: "Cardano",
      price: 2.25,
      total: 390,
      change: -1.4,
      volume: '2.3M',
      mcap: 69518430778,
      cs: 202578732,
      data: [1, 10, 7, 4, 8, 6, 2, 3, 6, 4, 3, 2],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/2010.png'),
  Coin(
      id: 'XRP',
      name: "Ripple",
      price: 1.09,
      total: 230,
      change: 4.2,
      volume: '3.2M',
      mcap: 50945540150,
      cs: 468573456,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/52.png'),
  Coin(
      id: 'DOGE',
      name: "Dogecoin",
      price: 0.25,
      total: 2400,
      change: -0.36,
      volume: '15.8M',
      mcap: 29466782605,
      cs: 951838259,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 2, 1],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/74.png'),
  Coin(
      id: 'DOT',
      name: "Polkadot",
      price: 32.42,
      total: 237.52,
      change: 4.2,
      volume: '49.5K',
      mcap: 34458688718,
      cs: 987579315,
      data: [1, 10, 7, 4, 8, 6, 2, 3, 6, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/6636.png'),
  Coin(
      id: 'AAVE',
      name: "Aave",
      price: 314.60,
      total: 1390,
      change: -1.45,
      volume: '705.89',
      mcap: 3782177345,
      cs: 13191488,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 2, 1],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/7278.png'),
  Coin(
      id: 'LINK',
      name: "Chainlink",
      price: 27.62,
      total: 65,
      change: -1.4,
      volume: '260.4M',
      mcap: 11172568756,
      cs: 456509554,
      data: [1, 10, 7, 6, 2, 3, 5, 4, 6, 4, 2, 1],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1975.png'),
  Coin(
      id: 'LTC',
      name: "Litecoin",
      price: 18.60,
      total: 193.21,
      change: 2.9,
      volume: '5K',
      mcap: 11640370625,
      cs: 68691433,
      data: [1, 10, 2, 4, 5, 3, 8, 4, 7, 4, 7, 9],
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/2.png'),
];

class News {
  String image, title;
  int id;

  News({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<News> newses = [
  News(
      id: 1,
      title: 'The Importance Of Crypto Portfolio Diversification ',
      image:
          'https://academy-public.coinmarketcap.com/optimized-uploads/695169cb8b2040468194fef6a6ee6e01.png'),
  News(
      id: 2,
      title: 'Is Fintech Giant Stripe Going Crypto Again?',
      image:
          'https://academy-public.coinmarketcap.com/optimized-uploads/2be5bce144a140629cb89596355b4b19.jpg'),
  News(
      id: 3,
      title: 'What Are All the Big Companies Doing with Crypto?',
      image:
          'https://academy-public.coinmarketcap.com/optimized-uploads/4fb8dc8f20fb4cda8ca6c18bcbde10ec.jpg'),
  News(
      id: 4,
      title: 'Tom Brady Wants to Get Paid in Bitcoin',
      image:
          'https://academy-public.coinmarketcap.com/optimized-uploads/5505c1b13888448d892cbc01824df023.png'),
  News(
      id: 5,
      title: 'Ethereum Dreams To Flip Bitcoin – Can It Happen?',
      image:
          'https://academy-public.coinmarketcap.com/optimized-uploads/ff86dae7b4464e27b7f3949c2e05fd7c.jpg'),
];
