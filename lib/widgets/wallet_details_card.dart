import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:convert';

import '../utils/user_prefs.dart';

import 'package:http/http.dart' as http;

class WalletDetailsCard extends StatefulWidget {
  final theme;
  final size;
  final String balance;
  final String name;
  final String email;
  final String phoneNumber;

  const WalletDetailsCard({
    this.theme,
    this.size,
    required this.balance,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  _WalletDetailsCardState createState() => _WalletDetailsCardState();
}

class _WalletDetailsCardState extends State<WalletDetailsCard> {
  late Razorpay _razorpay;
  late String _orderId;
  late String _addAmount;

  Future<http.Response> createOrder() async {
    final String _token = UserPreferences.getToken() ?? '';

    http.Response _response = await http.post(
      Uri.parse('https://charted-server.herokuapp.com/transactions/add'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': _token,
      },
      body: json.encode({"amount": 100}),
    );

    return _response;
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    try {
      http.Response _response = await http.post(
        Uri.parse(
            'https://charted-server.herokuapp.com/transactions/add/success'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'amount': _addAmount,
          'orderCreationId': _orderId,
          'razorpayPaymentId': response.paymentId,
          'razorpayOrderId': response.orderId,
          'razorpaySignature': response.signature,
        }),
      );

      if (_response.statusCode == 200) {
        Map<String, dynamic> _body =
            json.decode(_response.body) as Map<String, dynamic>;

        //Update balance using provider
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }
  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.28,
      width: widget.size.width * 0.9,
      decoration: BoxDecoration(
        color: widget.theme.accentColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //title
          Text(
            'My Wallet',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Amount
          Text(
            '\$' + widget.balance,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Icon Buttons
          Container(
            width: widget.size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Add Button
                _walletCardIconButton(widget.theme, widget.size, 'Add',
                    Icons.arrow_downward_rounded, () async {
                  print('Add button tapped');

                  try {
                    final _response = await createOrder();

                    if (_response.statusCode == 200) {
                      Map<String, dynamic> _body =
                          json.decode(_response.body) as Map<String, dynamic>;

                      _orderId = _body['id'].toString();

                      print('BODYYYYYYYYYYYYYYYYYY' + _body.toString());

                      _addAmount = _body['amount'].toString();
                      print('AMOUNTTTTTTTTTTT' + _addAmount);
                    }
                  } on Exception catch (e) {
                    print(e);
                  }

                  var options = {
                    'key': 'rzp_test_QmzLview4RmIzC',
                    'amount': _addAmount, //in the smallest currency sub-unit.
                    'name': 'charted',
                    'order_id': _orderId, // Generate order_id using Orders API
                    'prefill': {
                      'contact': widget.phoneNumber,
                      'email': widget.email,
                      'name': widget.name,
                    }
                  };

                  try {
                    _razorpay.open(options);
                  } catch (e) {
                    debugPrint('Error: e');
                  }
                }),

                //Withdraw Button
                _walletCardIconButton(widget.theme, widget.size, 'Withdraw',
                    Icons.arrow_upward_rounded, () {
                  print('Withdraw button tapped');
                }),

                //History Button
                _walletCardIconButton(
                    widget.theme, widget.size, 'More', Icons.more_horiz_rounded,
                    () {
                  print('More button tapped');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletCardIconButton(
    final theme,
    final size,
    String label,
    IconData icon,
    final Function() _action,
  ) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Icon
          GestureDetector(
            onTap: _action,
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),

          //Label
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
