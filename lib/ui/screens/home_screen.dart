import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallet_app/ui/component/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              _cardWalletBalnce(total: "120", totalCrypto: "4 BTC", percent: 5),
              _cardWalletBalnce(
                  total: "400", totalCrypto: "100 ETH", percent: 15),
              _cardWalletBalnce(
                  total: "400", totalCrypto: "500 USDT", percent: 75),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sorted by Hegher %',
                style: TextStyle(color: Colors.black45),
              ),
              Row(
                children: const [
                  Text(
                    '24H',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _listCryptoItem(
                      iconPath: 'assets/icons/Bitcoin-icon.png',
                      myCryoto: '12.345234 BTC',
                      myProfit: '\$19.23',
                      myBalance: '\$5.46',
                      percent: 4.5),
                  _listCryptoItem(
                      iconPath: 'assets/icons/Ethereum-icon.png',
                      myCryoto: '12.345234 BTC',
                      myProfit: '\$19.23',
                      myBalance: '\$5.46',
                      percent: 4.5),
                  _listCryptoItem(
                      iconPath: 'assets/icons/Ripple-icon.png',
                      myCryoto: '12.345234 BTC',
                      myProfit: '\$19.23',
                      myBalance: '\$5.46',
                      percent: 4.5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listCryptoItem({
    String? iconPath,
    double? percent,
    String? myCryoto,
    String? myBalance,
    String? myProfit,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            '$iconPath',
            width: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$myCryoto',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$myProfit',
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$myBalance',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                '+$percent%',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green),
              )
            ],
          )
        ],
      )),
    );
  }

  Widget _cardWalletBalnce(
      {required String total, required String totalCrypto, double? percent}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: card(
          width: MediaQuery.of(context).size.width - 50,
          padding: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ClipOval(
                    child: Material(
                      color: Colors.black,
                      child: InkWell(
                        splashColor: Colors.black,
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Text(
                      'Total Wallet Balance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: const [
                      Text("USD"),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$total',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: percent! >= 0 ? Colors.green : Colors.pink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      percent >= 0 ? '+ $percent %' : '- $percent %',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$totalCrypto',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black45,
                ),
              ),
              const Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ));
  }
}
