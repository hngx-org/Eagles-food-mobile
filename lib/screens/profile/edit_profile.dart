import 'package:flutter/material.dart';
import 'package:hng_task3/providers/ProfileProvider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import '../../components/custom_button.dart';
import '../../configs/colors.dart';
import '../../utils/toast.dart';
import '../../utils/utils.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final userData = {
    "firstName": '',
    "lastName": "",
    "email": "",
    "profilePic": "",
    "phone": '',
  };

  void selectProfilePic() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    );

    if (result != null && result.files.isNotEmpty) {
      for (final file in result.files) {
        setState(() {
          userData['profilePic'] = file.path!.toString();
        });
      }}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
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
                        "Free Launch",
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
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding:
            const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: Text(
                    "Edit Profile",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      userData['profilePic']!.isNotEmpty?
                                      userData['profilePic']!:
                                      'assets/icons/man-avatar-icon.png'),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "First Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.LightGrey,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                onChanged: (value) {
                                  userData['firstName'] = value;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.Grey, fontSize: 16),
                                  hintText: '',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                                keyboardType: TextInputType.text,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Last Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.LightGrey,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                onChanged: (value) {
                                  userData['lastName'] = value;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.Grey, fontSize: 16),
                                  hintText: '',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                keyboardType: TextInputType.text,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.LightGrey,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isNotEmpty && !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                onChanged: (value) {
                                  userData['email'] = value;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.Grey, fontSize: 16),
                                  hintText: '',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Phone",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.LightGrey,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                onChanged: (value) {
                                  userData['phone'] = value;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      color: ColorUtils.Grey, fontSize: 16),
                                  hintText: '',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                                keyboardType: TextInputType.number,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomButton(
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  Utils.loadingProgress(context);
                                  final response =
                                  await Provider.of<ProfileProvider>(context,
                                      listen: false)
                                      .updateProfile(userData);
                                  Navigator.pop(context);
                                  if (response) {

                                    Toasts.showToast(
                                        Colors.green, 'Profile updated successfully');
                                  }
                                }
                              },
                              buttonText: "Update Profile",
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
          ),
        ));
  }
}
