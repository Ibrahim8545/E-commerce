import 'package:ecommerce_online_c11/config/routes_manager/routes.dart';
import 'package:ecommerce_online_c11/core/api/api_manager.dart';
import 'package:ecommerce_online_c11/core/utils/assets_manager.dart';
import 'package:ecommerce_online_c11/core/utils/color_manager.dart';
import 'package:ecommerce_online_c11/core/utils/components/custom_elevated_button.dart';
import 'package:ecommerce_online_c11/core/utils/components/main_text_field.dart';
import 'package:ecommerce_online_c11/core/utils/components/validators.dart';
import 'package:ecommerce_online_c11/core/utils/styles_manager.dart';
import 'package:ecommerce_online_c11/core/utils/values_manager.dart';
import 'package:ecommerce_online_c11/features/auth/data/data_source/remote/auth_remote_ds_impl.dart';
import 'package:ecommerce_online_c11/features/auth/data/repository/auth_repo_impl.dart';
import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';
import 'package:ecommerce_online_c11/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/signup_bloc/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(
          SignUpUseCase(AuthRepoImpl(AuthRemoteDsImpl(ApiManager())))),
      child:
          BlocConsumer<SignupBloc, AuthSigupState>(listener: (context, state) {
        if (state.requestState == RequestState.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup Successfully')),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainRoute, (r) => false);
        }
        if (state.requestState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('email or password is wrong')),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      controller: fullname,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: phoneNumber,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: emailContoller,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: passwordContoller,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20),
                          onTap: () {
                            SignUpEntity entity = SignUpEntity(
                              fullName: fullname.text,
                              phone: phoneNumber.text,
                              email: emailContoller.text,
                              password: passwordContoller.text,
                            );
                            BlocProvider.of<SignupBloc>(context)
                                .add(SignupEvent(signUpEntity: entity));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
