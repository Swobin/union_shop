import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Union Shop',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(
              'Write your company blurb here. Add mission, history, contact details, social links, or anything customers should know.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text('Contact', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text('Email: hello@yourshop.example'),
            SizedBox(height: 8),
            Text('Phone: +44 1234 567890'),
          ],
        ),
      ),
    );
  }
}