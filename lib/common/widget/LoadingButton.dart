import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(() => _isLoading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onSubmit,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: _isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              )
            : const Text('ORDER NOW'),
      ),
    );
  }
}
