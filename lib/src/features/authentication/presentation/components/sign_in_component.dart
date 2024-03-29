import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propay/gen/colors.gen.dart';
import 'package:propay/src/core/core.dart';
import 'package:propay/src/core/custom_widget_shared/title_auth.dart';
import 'package:propay/src/features/authentication/bloc/signin/signin_bloc.dart';
import 'package:propay/src/features/authentication/bloc/signin/signin_event.dart';
import 'package:propay/src/features/authentication/bloc/signin/signin_state.dart';
import 'package:propay/src/features/authentication/bloc/toggle_form_bloc.dart';

typedef VoidCallback = void Function(bool value);

class SignInComponent extends StatelessWidget {
  const SignInComponent({
    super.key,
  });

  // final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleAuthText(
          title: 'Sign In',
        ),
        SizedBox(
          height: 50.h,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone nulmber',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<SignInBloc, FormSignState>(
                builder: (context, state) {
                  return TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => context
                        .read<SignInBloc>()
                        .add(PhoneNumberChangedEvent(value)),
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey.withOpacity(.5)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.all(12.h),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey.withOpacity(.5)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<SignInBloc, FormSignState>(
                builder: (context, state) {
                  return TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => context
                        .read<SignInBloc>()
                        .add(PasswordChangedEvent(value)),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey.withOpacity(.5)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.all(12.h),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey.withOpacity(.5)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'resend Password',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
          ],
        ),
      ],
    );
  }
}
