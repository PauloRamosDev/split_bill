import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var divisor = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          //titulo
          Text(
            'Split Bill',
            textScaleFactor: 2,
          ),
          Padding(padding: EdgeInsets.all(8)),
          //card de detalhes
          Container(
            child: Stack(
              children: <Widget>[
                //total
                Positioned(
                  top: 30,
                  left: 10,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'TOTAL',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' \$80,00',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //detalhes
                Positioned(
                  top: 40,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'BILL              \$80,00 ',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'FRIENDS      2',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'TIPS(10%)   \$8,00',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.white12,
                    ),
                  ),
                  right: -80,
                  bottom: 45,
                ),
                Positioned(
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.white12,
                    ),
                  ),
                  right: 0,
                  bottom: 45,
                ),
              ],
            ),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black),
          ),
          Padding(padding: EdgeInsets.all(8)),
          //slider de divisão
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.people),
              Slider(
                activeColor: Colors.black,
                inactiveColor: Colors.grey.shade400,
                value: divisor,
                onChanged: (change) {
                  setState(() {
                    divisor = change;
                  });
                },
                min: 2.0,
                max: 10.0,
              ),
              Text(divisor.toInt().toString()),
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          //porcentagem da conta
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                4,
                (index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: index!=0?Colors.grey.shade300:Colors.green, width: 2)),
                      height: 50,
                      width: 70,
                      child: Center(
                          child: Text(
                        " ${(index + 1) * 10} %",
                        style: TextStyle(color: index!=0?Colors.grey.shade500:Colors.green),
                      )),
                    )),
          ),
          Padding(padding: EdgeInsets.all(8)),
          //teclado virtual
          GridView.count(
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: List.generate(
                12,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        color: Colors.grey.shade50,
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          textScaleFactor: 1.4,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    )),
          ),
          Padding(padding: EdgeInsets.all(8)),
          //botão split
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                'SPLIT BILL',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(16),
              color: Colors.green,
              elevation: 0,
            ),
          )
        ],
      ),
    ));
  }
}
