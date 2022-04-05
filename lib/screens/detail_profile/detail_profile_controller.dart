import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:valua_examinee/constants/app.dart';
import 'package:valua_examinee/models/account.dart';
import 'package:valua_examinee/providers/auth_provider.dart';
import 'package:valua_examinee/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final Account currentUser;
  final genders = ["Male", "Female"].obs;
  late TextEditingController emailController,
      phoneController,
      fullNameController,
      birthdateController,
      addressController;
  final ImagePicker _picker = ImagePicker();
  final image = Rx<XFile?>(null);
  late final dynamic gender;
  final AuthRepository _provider = Get.find<AuthProvider>();
  final isLoading = false.obs;
  final GetStorage _storage = GetStorage(AppConstant.storageKey);
  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void onInit() {
    currentUser =
        Account.fromJson(jsonDecode(_storage.read(AppConstant.appUser)));
    emailController = TextEditingController(text: currentUser.email);
    fullNameController = TextEditingController(text: currentUser.fullName);
    birthdateController = TextEditingController(
        text: _dateFormat.format(DateTime.parse(currentUser.birthdate)));
    phoneController = TextEditingController(text: currentUser.phoneNumber);
    addressController = TextEditingController(text: currentUser.address);
    gender = currentUser.gender.toString().obs;
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image.value = image;
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateFormat.parse(birthdateController.text),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthdateController.text = _dateFormat.format(picked);
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final Account account = currentUser;
        account.fullName = fullNameController.text;
        account.gender = genders.indexOf(gender);
        account.address = addressController.text;
        account.phoneNumber = phoneController.text;
        account.birthdate =
            _dateFormat.parse(birthdateController.text).toIso8601String();
        final FormData _formData = FormData({
          'account': jsonEncode({
            "fullName": account.fullName,
            "gender": account.gender,
            "birthdate": account.birthdate,
            "address": account.address,
            "phoneNumber": account.phoneNumber,
          }),
          if (image.value != null)
            'profilePicture': MultipartFile(
              File(image.value!.path),
              filename: image.value!.name,
            ),
        });
        final Account data = await _provider.updateProfile(_formData);
        data.gender = gender.value;
        _storage.write("user", jsonEncode(data));
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Update profile success",
        );
      } catch (e) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: e.toString(),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
