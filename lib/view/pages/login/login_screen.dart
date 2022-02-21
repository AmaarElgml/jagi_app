import 'package:jagi_app/provider/model_hud.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/view/pages/admin/admin_home/admin_screen.dart';
import 'package:jagi_app/view/pages/register/signup_screen.dart';
import 'package:jagi_app/view/pages/main/main_screen.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'package:jagi_app/view/widgets/intro_titles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'login_screen_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  static final String id = 'LoginScreen.id';
  final LoginScreenViewModel viewModel = LoginScreenViewModel();

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
                      IntroTitles(isLogin: true),
                      SizedBox(height: height * .1),
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
                          title: 'Login',
                          onPressed: () {
                            _validate(context);
                          }),
                      SizedBox(height: height * .05),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?', style: smallStyle),
                            SizedBox(width: defSpacing / 4),
                            GestureDetector(
                                onTap: () {
                                  navigateReplaceTo(context, SignupScreen.id);
                                },
                                child: Text('Register',
                                    style: titlesStyle.copyWith(fontSize: 16)))
                          ])
                    ])))));
  }

  _validate(BuildContext context) async {
    final modelHUD = Provider.of<ModelHUD>(context, listen: false);
    modelHUD.updateIsLoading(true);
    if (viewModel.globalKey.currentState!.validate()) {
      viewModel.globalKey.currentState!.save();
      viewModel.login().then((value) {
        modelHUD.updateIsLoading(false);
        // Admins instead of building second login screen
        if (adminPassword == viewModel.password &&
            adminEmail == viewModel.email)
          navigateTo(context, AdminScreen.id);
        else
          viewModel.saveUser().then((_) {
            navigateTo(context, MainScreen.id);
          });
      }).catchError((e) {
        modelHUD.updateIsLoading(false);
        showSnackBar(context, e.toString());
      });
    }
    modelHUD.updateIsLoading(false);
  }
}
