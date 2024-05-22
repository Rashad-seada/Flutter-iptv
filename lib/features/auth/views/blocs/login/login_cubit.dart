import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/login_use_case.dart';
import 'package:smart_soft/features/auth/utils/register_type.dart';
import 'package:smart_soft/features/auth/utils/role.dart';
import 'package:smart_soft/features/auth/views/screens/02_register_screen.dart';
import 'package:smart_soft/features/auth/views/screens/03_reset_password_screen.dart';
import 'package:smart_soft/features/main/views/main_screen.dart';


import '../../../../../core/core_feature/domain/usecases/validate_password_use_case.dart';
import '../../../../../core/core_feature/domain/usecases/validate_phone_use_case.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = true ;

  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? validatePhone(){
    return getIt<ValidatePhoneUseCase>().call(phoneNumberController.text);
  }

  String? validatePassword(){
    return getIt<ValidatePasswordUseCase>().call(passwordController.text);
  }

  onForgotPasswordClick(BuildContext context){
    _navigateToResetPasswordScreen(context);
  }

  onLoginClick(BuildContext context){
    // if(formKey.currentState!.validate()) {
    //   login(context);
    // }
    _navigateToMainScreen(context);
  }

  onRegisterClick(BuildContext context){
    _navigateToRegisterScreen(context);
  }


  String formatPhoneNumber(String phoneNumber){
    String formatedPhoneNumber = "";
    for(int i = 0; i < phoneNumber.length ; i++) {
      if(int.tryParse(phoneNumber[i]) != null) {
        formatedPhoneNumber += phoneNumber[i];
      }
    }
    return formatedPhoneNumber;
  }

  getUser(BuildContext context){
    getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
              emit(LoginError(error));
              showFlushBar(
                  context,
                  title: "Error ${error.failureCode}",
                  message : error.message
              );
              emit(LoginInitial());
            },
            (user) {


              switch(user.role) {

                case Role.admin :
                  _navigateToAdminHomeScreen(context);
                  emit(LoginSuccess());
                  break;

                case Role.seller :
                  _navigateToSellerHomeScreen(context);
                  emit(LoginSuccess());
                  break;

                case Role.customer :
                  _navigateToMainScreen(context);
                  emit(LoginSuccess());
                  break;

                default:
                  showFlushBar(
                      context,
                      title: "Error",
                      message : "Undefined user role"
                  );
                  emit(LoginError(Failure("Undefined user role", failureCode: 0)));
                  break;
              }
              emit(LoginInitial());

            }
    ));

  }

  login(BuildContext context){
    emit(LoginLoading());
    getIt<LoginUseCase>().call(formatPhoneNumber(phoneNumberController.text), passwordController.text).then(
      (value) => value.fold(
        (error) {
          emit(LoginError(error));
          showFlushBar(
            context,
            title: "Error ${error.failureCode}",
            message : error.message
          );
          emit(LoginInitial());
        },
        (user) async {

          await getUser(context);

        }
      )
    );
  }

  _navigateToRegisterScreen(BuildContext context){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> RegisterScreen()));
  }

  _navigateToResetPasswordScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const ResetPasswordScreen()));
  }

  _navigateToMainScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const MainScreen()));
  }

  _navigateToSellerHomeScreen(BuildContext context){
   // Navigator.push(context,MaterialPageRoute(builder: (_)=> const SellerHomeScreen()));
  }

  _navigateToAdminHomeScreen(BuildContext context){
    //Navigator.push(context,MaterialPageRoute(builder: (_)=> const AdminHomeScreen()));
  }

}
