import 'package:jagi_app/view/pages/login/login_screen.dart';
import 'package:jagi_app/view/pages/main/main_screen.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/provider/model_hud.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'package:jagi_app/view/widgets/intro_titles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'signup_screen_viewmodel.dart';

class SignupScreen extends StatelessWidget {
  static final String id = 'SignupScreen.id';
  final SignUpScreenViewModel viewModel = SignUpScreenViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: Provider.of<ModelHUD>(context).isLoading,
            child: Form(
                key: viewModel.globalKey,
                child: Padding(
                    padding: EdgeInsets.only(
                        right: defSpacing * 2,
                        left: defSpacing * 2,
                        top: height * .06),
                    child: ListView(children: [
                      IntroTitles(isLogin: false),
                      SizedBox(height: height * .1),
                      CustomTextField(
                          hint: 'Enter your name',
                          iconData: Icons.person,
                          onSaved: (value) {
                            viewModel.name = value;
                          }),
                      SizedBox(height: height * .02),
                      CustomTextField(
                          hint: 'Enter your email',
                          iconData: Icons.email,
                          onSaved: (value) {
                            viewModel.email = value;
                          }),
                      SizedBox(height: height * .02),
                      CustomTextField(
                          hint: 'Enter your password',
                          iconData: Icons.lock,
                          onSaved: (value) {
                            viewModel.password = value;
                          }),
                      SizedBox(height: height * .05),
                      CustomButton(
                          title: 'Register',
                          onPressed: () {
                            _validate(context);
                          }),
                      SizedBox(height: height * .05),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?', style: smallStyle),
                            SizedBox(width: defSpacing / 4),
                            GestureDetector(
                                onTap: () {
                                  navigateReplaceTo(context, LoginScreen.id);
                                },
                                child: Text('Login',
                                    style: titlesStyle.copyWith(fontSize: 16)))
                          ])
                    ])))));
  }

  _validate(BuildContext context) {
    final modelHUD = Provider.of<ModelHUD>(context, listen: false);
    modelHUD.updateIsLoading(true);
    if (viewModel.globalKey.currentState!.validate()) {
      viewModel.globalKey.currentState!.save();
      viewModel.register().then((value) {
        modelHUD.updateIsLoading(false);
        viewModel.saveUser().then((_) {
          navigateTo(context, MainScreen.id);
        });
      }).catchError((e) {
        modelHUD.updateIsLoading(false);
        showSnackBar(context, e.toString());
      });
      modelHUD.updateIsLoading(false);
    }
  }
}
