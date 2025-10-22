import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Components {
  static Widget textContentSmall(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 14, color: Colors.black));
  }

  static Widget textContentMedium(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 18, color: Colors.black));
  }

  static Widget textContentLarge(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 22, color: Colors.black));
  }

  static Widget textHeadlineSmall(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold));
  }

  static Widget textHeadlineMedium(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold));
  }

  static Widget textHeadlineLarge(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold));
  }

  static Widget textLightSmall(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 86, 86, 86),
            fontWeight: FontWeight.w300));
  }

  static Widget textLightMedium(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 86, 86, 86),
            fontWeight: FontWeight.w300));
  }

  static Widget textLightLarge(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 86, 86, 86),
            fontWeight: FontWeight.w300));
  }

  static Widget myButton(
    String text,
    VoidCallback onPressed, {
    Color? textColor,
    Color? color,
    GFButtonType type = GFButtonType.solid,
    double borderRadius = 8,
  }) {
    return GFButton(
      onPressed: onPressed,
      text: text,
      color: color ?? Colors.indigo,
      textStyle: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
      borderShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      type: type,
      fullWidthButton: true,
      size: GFSize.LARGE,
    );
  }

  static Widget myCard(
    String title,
    List<String> contents,
    List<IconData> icons,
    List<VoidCallback> onIconPressed, {
    List<Color>? iconColors,
  }) {
    return GFCard(
      boxFit: BoxFit.cover,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...contents.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                c,
                style: Theme.of(Get.context!).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
      buttonBar: GFButtonBar(
        children: List.generate(
          icons.length,
          (index) => GFIconButton(
            icon: Icon(
              icons[index],
              color: iconColors != null && iconColors.length > index
                  ? iconColors[index]
                  : Colors.grey[700],
            ),
            onPressed:
                onIconPressed.length > index ? onIconPressed[index] : null,
            type: GFButtonType.transparent,
          ),
        ),
      ),
    );
  }

  static Widget showLoading({String? text}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GFLoader(type: GFLoaderType.circle),
          if (text != null) ...[
            const SizedBox(height: 12),
            Text(
              text,
              style: Theme.of(Get.context!).textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }

  static Widget hideLoading() => const SizedBox.shrink();

  static void showInfo(String title, String message) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
      radius: 10,
    );
  }

  static void showActionDialog({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = "Ya",
    String cancelText = "Batal",
    Color confirmColor = Colors.indigo,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textCancel: cancelText,
      textConfirm: confirmText,
      confirmTextColor: Colors.white,
      buttonColor: confirmColor,
      onConfirm: () {
        Get.back();
        onConfirm();
      },
      onCancel: () => Get.back(),
      radius: 10,
    );
  }

  static void showToast(String message, {Color? bgColor}) {
    GFToast.showToast(
      message,
      Get.overlayContext!,
      toastPosition: GFToastPosition.BOTTOM,
      backgroundColor: bgColor ?? Colors.black87,
      textStyle: const TextStyle(color: Colors.white),
    );
  }

  static Widget myTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool isPassword = false,
    bool isSearch = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    VoidCallback? onSearch,
    VoidCallback? onEditingCompleted,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onIconPressed, // 👈 tetap ada
    Color? fillColor,
    double? width,
  }) {
    final RxBool obscure = isPassword.obs;

    Widget field = Obx(
      () => Stack(
        alignment: Alignment.centerRight,
        children: [
          GFTextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscure.value,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              filled: true,
              fillColor: fillColor ?? Colors.grey[100],
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscure.value ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                      ),
                      onPressed: () => obscure.value = !obscure.value,
                    )
                  : (isSearch
                      ? IconButton(
                          icon: const Icon(Icons.search, size: 20),
                          onPressed: onSearch,
                        )
                      : null),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: onChanged,
            validatornew: validator,
            onEditingComplete: onEditingCompleted,
          ),

          if (suffixIcon != null)
            Positioned(
              right: 8,
              child: IconButton(
                icon: Icon(suffixIcon, size: 22),
                onPressed: onIconPressed,
              ),
            ),
        ],
      ),
    );

    return width != null ? SizedBox(width: width, child: field) : field;
  }

  static Widget textfield(
      {required String hintText,
      required TextEditingController controller,
      ValueChanged<String>? onChanged}) {
    return GFTextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
