import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_task3/screens/auth/forgot_password/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../configs/colors.dart';
import '../../../widgets/custom_button.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key, required this.email});
  final String email;


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/icons/icon-back.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/logo_green.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Free Lunch",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding:
            const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: Text(
                    "Verify your account",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  "Please enter the 4-DIGIT pin sent to $email.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "OTP",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.LightGrey,
                                      fontSize: 16),
                                ),
                              ),
                              PinCodeTextField(
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter code.';
                                  }
                                  if(value.length==1){
                                    return '3 entries left';
                                  }
                                  if(value.length==2){
                                    return '2 entries left';
                                  } if(value.length==3){
                                    return '1 entries left';
                                  }
                                  return null;
                                },
                                appContext: context,
                                controller: controller,
                                length: 4,
                                onChanged: (value){},
                                cursorHeight: 19,
                                enableActiveFill: true,
                                textStyle: Theme.of(context).textTheme.displaySmall,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  fieldWidth: 70,
                                  fieldHeight: 70,
                                  inactiveColor: ColorUtils.Grey,
                                  selectedColor: ColorUtils.Green.withOpacity(0.5),
                                  activeFillColor: ColorUtils.Green,
                                  selectedFillColor: ColorUtils.Green,
                                  inactiveFillColor: ColorUtils.LightGrey,
                                  borderWidth: 0,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomButton(
                              onPress: () async {
                                if (formKey.currentState!.validate()) {
                                  //Utils.loadingProgress(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>
                                          const ResetPasswordScreen()));
                                }
                              },
                              buttonText: "Submit",
                              buttonColor: ColorUtils.Green,
                              textColor: ColorUtils.White,
                              isUppercase: true),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
