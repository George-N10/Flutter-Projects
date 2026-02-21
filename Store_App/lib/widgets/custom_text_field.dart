import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  CustomFormTextField({
    this.onChange,
    this.hintText,
    super.key,
    this.icon,
    this.obscureText = false,
    this.inputType,
  });

  String? hintText;
  IconData? icon;
  bool obscureText;
  Function(String)? onChange;
  TextInputType? inputType;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  // متغير عشان نتحكم في الظهور والاخفاء
  bool _isObsecure = false;

  @override
  void initState() {
    super.initState();
    // بنخلي القيمة الابتدائية زي ما انت باعتها في الكونستركتور
    _isObsecure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      obscureText: _isObsecure,
      onChanged: widget.onChange,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                  });
                },
                icon: Icon(
                  _isObsecure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
        hintText: widget.hintText,
        // hintStyle: TextStyle(color: Color(0xa5ccd0cf), fontSize: 18),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
