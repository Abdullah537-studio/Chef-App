import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_alert_dialog.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.data});
  final EditProfileRequest data;
  // final String? image;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerLocation = TextEditingController();

  final TextEditingController controllerDisc = TextEditingController();

  final TextEditingController controllerBradName = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerName.text = widget.data.name ?? '';
    controllerLocation.text = widget.data.location?.name ?? '';
    controllerDisc.text = widget.data.disc ?? '';
    controllerBradName.text = widget.data.brandName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.status == CubitStatus.loaded) {
          showAlertDialog(
              context: context,
              title: "success",
              body: state.message ?? "edit is success");
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
                    image: widget.data.profilePic,
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
                  controller: controllerLocation,
                  text: context.location,
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
                          context
                              .read<EditProfileCubit>()
                              .edit(editProfileRequest: widget.data);
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
