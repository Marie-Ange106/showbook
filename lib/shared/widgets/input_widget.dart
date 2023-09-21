import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? labelDecoration;
  final String? label;
  final TextInputAction? textInputAction;
  final List<String? Function(String?)> validators;
  final bool readOnly;
  final bool? showCursor;
  final bool? required;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final String? placeholder;

  const InputWidget({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.label,
    this.textInputAction,
    this.showCursor,
    this.labelDecoration,
    this.required = false,
    this.readOnly = false,
    this.validators = const [],
    this.contentPadding,
    this.maxLines,
    this.placeholder,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Row(
            children: [
              Flexible(
                child: Text(
                  "${widget.label}",
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              if (widget.required!)
                const Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
            ],
          ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          // maxLines: widget.maxLines,
          
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          readOnly: widget.readOnly,
          validator: FormBuilderValidators.compose(widget.validators),
          showCursor: widget.showCursor,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            
            labelText: widget.placeholder,
            contentPadding: widget.contentPadding,
            label: widget.labelDecoration,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 254, 2, 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
