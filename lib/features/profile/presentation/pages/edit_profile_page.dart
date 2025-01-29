import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/get_profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.profileCubit});
  final ProfileCubit profileCubit;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // EditProfileRequest? _userData = EditProfileRequest();

  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerDisc = TextEditingController();

  final TextEditingController controllerBradName = TextEditingController();

  EditProfileRequest? _userData;

  @override
  void initState() {
    _userData = widget.profileCubit.data;
    controllerName.text = _userData?.name ?? '';
    controllerDisc.text = _userData?.disc ?? '';
    controllerBradName.text = _userData?.brandName ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profileCubit,
      child: Scaffold(
        appBar: mainAppBar(context, context.editProfile),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.cubitStatus == CubitStatus.error) {
              showToast(ToastMessageStatus.error, state.message);
            } else if (state.cubitStatus == CubitStatus.loaded) {
              showToast(ToastMessageStatus.success, state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: CustomImageWithEdit(
                      image: _userData?.profilePic,
                      value: (val) {
                        if (val != null) {
                          _userData?.profilePic = val.path;
                        }
                      },
                    ),
                  ),
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerName,
                    text: context.name,
                    onChanged: (value) {
                      _userData?.name = value;
                    },
                  ),
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerDisc,
                    text: context.disc,
                    onChanged: (value) {
                      _userData?.disc = value;
                    },
                  ),
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerBradName,
                    text: context.brandNamed,
                    onChanged: (value) {
                      _userData?.brandName = value;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 64.h,
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return MainButton(
                          isLoading: state.cubitStatus == CubitStatus.loading,
                          text: context.update,
                          onTap: () {
                            if (_userData != null) {
                              widget.profileCubit
                                  .edit(editProfileRequest: _userData!);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
