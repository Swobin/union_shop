import 'package:flutter/material.dart';

// Reusable footer widget
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Opening Hours
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opening Hours',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 12),
                    Text(
                      '''❄️ Winter Break Closure Dates ❄️

Closing 4pm 19/12/2025

Reopening 10am 05/01/2026

Last post date: 12pm on 18/12/2025
------------------------
(Term Time)

Monday - Friday 10am - 4pm

(Outside of Term Time / Consolidation
Weeks)

Monday - Friday 10am - 3pm

Purchase online 24/7''',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Help & Information
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Help and Information',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 12),
                    Text('Search'),
                    SizedBox(height: 6),
                    Text('Terms & Conditions of Sale'),
                    SizedBox(height: 6),
                    Text('Policy'),
                  ],
                ),
              ),

              // Latest Offers / Newsletter
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Latest Offers',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Email address',
                                  style: TextStyle(color: Colors.black54)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          color: const Color(0xFF4d2963),
                          alignment: Alignment.center,
                          child: const Text('SUBSCRIBE',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                      width: 36,
                      height: 36,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.facebook, size: 18)),
                  const SizedBox(width: 12),
                  Container(
                      width: 36,
                      height: 36,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.share, size: 18)),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Container(width: 40, height: 24, color: Colors.grey.shade100),
                  const SizedBox(width: 8),
                  Container(width: 40, height: 24, color: Colors.grey.shade100),
                  const SizedBox(width: 8),
                  const Text('© 2025, upsu-store'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}