import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../components/custom_button.dart';
import '../../configs/colors.dart';
import '../../utils/toast.dart';
import '../../utils/utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, this.user});
  final user;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final userData = {};
  File? image;

  // Future<void> pickImage() async {
  //   try {
  //     final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (pickedImage == null) return;
  //     final imageFile = File(pickedImage.path);
  //     setState(() {
  //       image = imageFile;
  //       userData['profilePic'] = imageFile.path;
  //     });
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  Future<String> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return "";
    }
    File imageFile = File(pickedFile.path);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64String = base64Encode(imageBytes);
    setState(() {
      image = imageFile;
      userData['profilePic'] = base64String;
    });
    return base64String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          titleSpacing: 0,
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
                      height: 40,
                      width: 40,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                child: Text(
                  "Edit Profile",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  pickImage();
                                },
                                child: image != null
                                    ? Container(
                                        margin: const EdgeInsets.only(top: 16),
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.file(
                                            image!,
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: ColorUtils.LightGrey),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: widget.user?.profilePic == ''
                                                ? const AssetImage(
                                                    "assets/icons/man-avatar-icon.png")
                                                : NetworkImage(
                                                        widget.user?.profilePic)
                                                    as ImageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: ColorUtils.LightGrey
                                                .withOpacity(0.2),
                                          ),
                                          child: const Icon(Icons.add_a_photo,
                                              color: Colors.white, size: 30),
                                        ),
                                      ),
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
                                value.isNotEmpty
                                    ? userData['firstName'] = value
                                    : '';
                              },
                              initialValue: widget.user.firstName,
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
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                              initialValue: widget.user.lastName,
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
                              readOnly: true,
                              enabled: false,
                              initialValue: widget.user.email,
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
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                              initialValue: widget.user.phone,
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
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              keyboardType: TextInputType.number,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: CustomButton(
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                Utils.loadingProgress(context);
                                dynamic data = {
                                  "email":
                                      userData['email'] ?? widget.user.email,
                                  "lastName": userData['lastName'] ??
                                      widget.user.lastName,
                                  "firstName": userData['firstName'] ??
                                      widget.user.firstName,
                                  "phone":
                                      userData['phone'] ?? widget.user.phone,
                                  "photo": userData['profilePic'] ??
                                      widget.user.profilePic,
                                };
                                final response =
                                    await Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .updateProfile(data);
                                Navigator.pop(context);
                                if (response == true) {
                                  Navigator.pop(context);
                                  Toasts.showToast(ColorUtils.Green,
                                      'Profile updated successfully');
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
        ));
  }
}
