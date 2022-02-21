import 'package:jagi_app/view/pages/main/main_screen.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'checkout_viewmodel.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'CheckoutScreen.id';
  final CheckoutViewModel viewModel = CheckoutViewModel();

  CheckoutScreen({totalPrice, products}) {
    viewModel.totalPrice = totalPrice ?? '';
    viewModel.products = products ?? [];
  }

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Checkout'), actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.id, (Route<dynamic> route) => false);
              })
        ]),
        body: SingleChildScrollView(
            child: Form(
          key: widget.viewModel.formKey,
          child: Stepper(
              onStepContinue: () {
                _validate(context);
              },
              onStepCancel: () {
                cancel();
              },
              currentStep: widget.viewModel.currentStep,
              steps: [
                Step(
                    title: Text('Address'),
                    isActive: widget.viewModel.complete,
                    state: StepState.editing,
                    content: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      CustomTextFieldData(
                          hint: 'Address ex: 34 Forest Road',
                          onSaved: (value) {
                            widget.viewModel.addressText = value;
                          }),
                      SizedBox(height: defSpacing / 2),
                      Row(children: [
                        Expanded(
                            child: CustomTextFieldData(
                                hint: 'City',
                                onSaved: (value) {
                                  widget.viewModel.city = value;
                                })),
                        Expanded(
                            child: CustomTextFieldData(
                                hint: 'State',
                                onSaved: (value) {
                                  widget.viewModel.state = value;
                                })),
                        Expanded(
                            child: CustomTextFieldData(
                                hint: 'Zip Code',
                                isString: false,
                                onSaved: (value) {
                                  widget.viewModel.zipCode = value;
                                }))
                      ])
                    ])),
                Step(
                    isActive: widget.viewModel.complete,
                    state: StepState.editing,
                    title: Text('Payment'),
                    content: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      CustomTextFieldData(
                          hint: 'Card Number',
                          isString: false,
                          onSaved: (value) {
                            widget.viewModel.cardNumber = value;
                          }),
                      SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: CustomTextFieldData(
                                hint: 'Expiration',
                                isString: false,
                                onSaved: (value) {
                                  widget.viewModel.expiration = value;
                                })),
                        Expanded(
                            child: CustomTextFieldData(
                                hint: 'Secure Code',
                                isString: false,
                                onSaved: (value) {
                                  widget.viewModel.sCode = value;
                                }))
                      ])
                    ])),
                Step(
                    isActive: widget.viewModel.complete,
                    state: StepState.complete,
                    title: Text('Done!'),
                    content: Column(children: <Widget>[
                      Container(
                          height: defSpacing * 20,
                          width: defSpacing * 20,
                          child: SvgPicture.asset('assets/images/icons/Completed.svg')),
                      SizedBox(height: defSpacing / 2),
                      Text('Your order is submitted successfully',
                          textAlign: TextAlign.center, style: TextStyle(color: KColor2, fontSize: 20))
                    ]))
              ],
              controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                return widget.viewModel.currentStep != 2
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: defSpacing / 2),
                        child: CustomButton(
                            title: 'Continue',
                            onPressed: () {
                              onStepContinue?.call();
                            }),
                      )
                    : SizedBox();
              }),
        )));
  }

  _validate(BuildContext context) {
    if (widget.viewModel.currentStep == 0)
      next();
    else {
      if (widget.viewModel.formKey.currentState!.validate()) {
        widget.viewModel.formKey.currentState!.save();
        setState(() {
          widget.viewModel.complete = true;
        });
        widget.viewModel.storeOrder();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        next();
      }
    }
  }

  next() {
    if (widget.viewModel.currentStep + 1 != 3) {
      goTo(widget.viewModel.currentStep + 1);
    }
  }

  cancel() {
    if (widget.viewModel.currentStep > 0) {
      goTo(widget.viewModel.currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => widget.viewModel.currentStep = step);
  }
}
