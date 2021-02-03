import 'package:flutter/material.dart';

// Counter button add multi products
class CounterButtonSmartVendors extends StatefulWidget {
  CounterButtonSmartVendors({
    Key key,
    @required this.onChangeQuantity,
    this.mainAxisAlignment,
  }) : super(key: key);

  final ValueChanged<num> onChangeQuantity;
  final MainAxisAlignment mainAxisAlignment;

  @override
  _CounterButtonSmartVendorsState createState() =>
      _CounterButtonSmartVendorsState();
}

class _CounterButtonSmartVendorsState extends State<CounterButtonSmartVendors> {
  num _quantity = 1;
  void changeQuantity() {
    widget.onChangeQuantity.call(_quantity);
  }

  valid(qty) {
    if (qty > 0 && qty < 1000) {
      return true;
    }
    return false;
  }

  void _countUp() {
    if (valid(_quantity + 1)) {
      setState(() {
        this._quantity += 1;
      });
      changeQuantity();
    }
  }

  void _countDown() {
    if (valid(_quantity - 1)) {
      setState(() {
        this._quantity -= 1;
      });
      changeQuantity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        FlatButton(
          onPressed: () => _countDown(),
          child: Text('-'),
          minWidth: 50,
          height: 40,
          color: Theme.of(context).buttonColor,
        ),
        Container(
          width: 50,
          height: 40,
          child: Center(
            child: Text(
              _quantity.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          // child: TextField(
          //   controller: textController,
          //   autofocus: false,
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     focusColor: Theme.of(context).accentColor,
          //     hoverColor: Theme.of(context).accentColor,
          //     filled: true,
          //     fillColor: Colors.white,
          //   ),
          // ),
        ),
        FlatButton(
          onPressed: () => _countUp(),
          child: Text('+'),
          minWidth: 50,
          height: 40,
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }
}
