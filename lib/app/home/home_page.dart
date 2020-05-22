import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/app/home/home_controller.dart';
import 'package:split_bill/app/home/widget_percent_count.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = BlocHome();

  var listTeclado = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '<',
    '0',
    'C'
  ];

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
                        ' \$${bloc.getBill}',
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
                        'BILL              \$${bloc.getBill} ',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'FRIENDS      ${bloc.friends}',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'TIPS(${bloc.currectPercent}%)   \$${bloc.tips}',
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
                value: bloc.friends.toDouble(),
                onChanged: (change) {
                  setState(() {
                    bloc.friends = change.toInt();
                  });
                },
                min: 2.0,
                max: 10.0,
              ),
              Text(
                bloc.friends.toString(),
                textScaleFactor: 1.3,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          //porcentagem da conta
          PercentCount(bloc.currectPercent, BlocHome.percents, (percent) {
            bloc.currectPercent = percent;
            setState(() {});
          }),
          Padding(padding: EdgeInsets.all(8)),
          //teclado virtual
          GridView.count(
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: List.generate(
                listTeclado.length,
                (index) => InkWell(
                      onTap: () => teclado(listTeclado[index]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          color: Colors.grey.shade50,
                          child: Center(
                              child: Text(
                            listTeclado[index],
                            textScaleFactor: 1.4,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )),
          ),
          Padding(padding: EdgeInsets.all(8)),
          //botão split
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                print('botao splint');
              },
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

  teclado(value) {
    if (value == 'C') {
      bloc.resetBill();
      setState(() {});
    } else if (value == '<') {
      bloc.backBill();
      setState(() {});
    } else {
      bloc.setBill = value;
      setState(() {});
    }
  }
}
