import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class WalletDetailsCard extends StatefulWidget {
  final theme;
  final size;
  final String balance;

  const WalletDetailsCard(this.theme, this.size, this.balance);

  @override
  _WalletDetailsCardState createState() => _WalletDetailsCardState();
}

class _WalletDetailsCardState extends State<WalletDetailsCard> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
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
                  var options = {
                    'key': 'rzp_test_QmzLview4RmIzC',
                    'amount': 50000, //in the smallest currency sub-unit.
                    'name': 'charted',
                    'order_id':
                        'order_HswCHDdv3kfNkh', // Generate order_id using Orders API
                    'prefill': {
                      'contact': '9123456789',
                      'email': 'gaurav.kumar@example.com'
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
