import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubit/get_profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileRequest? _userData;

  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerDisc = TextEditingController();

  final TextEditingController controllerBradName = TextEditingController();

  @override
  void initState() {
    _userData = context.read<ProfileCubit>().data;
    controllerName.text = _userData?.name ?? '';
    controllerDisc.text = _userData?.disc ?? '';
    controllerBradName.text = _userData?.brandName ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          showToast(ToastMessageStatus.error, state.message ?? "empty message");
        } else if (state.status == CubitStatus.loaded) {
          showToast(
              ToastMessageStatus.success, state.message ?? "empty message");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: mainAppBar(context, context.editProfile),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: CustomImageWithEdit(
                    image: _userData?.profilePic,
                    value: (val) {},
                  ),
                ),
                MainTextFormField(
                  validate: (val) => Validate.generalValidate(context, val),
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerName,
                  text: context.name,
                  onChanged: (value) {},
                ),
                MainTextFormField(
                  validate: (val) => Validate.generalValidate(context, val),
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerDisc,
                  text: context.disc,
                  onChanged: (value) {},
                ),
                MainTextFormField(
                  validate: (val) => Validate.generalValidate(context, val),
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerBradName,
                  text: context.brandNamed,
                  onChanged: (value) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 64.h,
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return MainButton(
                        isLoading: state.status == CubitStatus.loading,
                        text: "Update",
                        onTap: () {
                          if (_userData != null) {
                            context
                                .read<EditProfileCubit>()
                                .edit(editProfileRequest: _userData!);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
