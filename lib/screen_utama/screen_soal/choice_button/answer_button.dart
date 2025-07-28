import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40 ,vertical:10 ),
          // `backgroundColor` adalah untuk warna isian (latar belakang) tombol.
          // Di sini kita gunakan warna krem dengan sedikit transparansi untuk keadaan default.
          backgroundColor: const Color.fromRGBO(255, 253, 208, 0.15),
          // `foregroundColor` adalah untuk warna konten di dalamnya (teks atau ikon).
          // Kita gunakan warna krem solid agar teksnya jelas terbaca.
          foregroundColor: const Color.fromRGBO(255, 253, 208, 1),
        ), 
      child: Text(
        answer,
        textAlign: TextAlign.center,
        )
      );
  }
}