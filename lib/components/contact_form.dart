import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // Controllers to capture user inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Create a GlobalKey for the form to handle validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Get In Touch With Us",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 400,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    contactFormField("Name*", 1, "Your Name", nameController),
                    contactFormField("Email*", 1, "Your Email", emailController),
                    contactFormField("Phone Number", 1, "Your Number", phoneController),
                    contactFormField("Message*", 10, "Your Message", messageController),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                sendEmail(
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  messageController.text,
                                ).then((_) {
                                  // Show success dialog after email is sent
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Success"),
                                      content: const Text(
                                          "Your message has been successfully submitted. Our team will contact you soon."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Form field widget
  Widget contactFormField(name, maxLine, hintText, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              controller: controller,
              maxLines: maxLine,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
              // Add validation logic
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$name is required';
                }
                if (name == "Email*" &&
                    !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to send email via EmailJS
  Future<void> sendEmail(
      String name, String email, String phone, String message) async {
    final String _userId =
        'shD9Iu34H50MvBtM8'; // Replace with your EmailJS user ID
    final String _serviceId =
        'service_xillp2d'; // Replace with your EmailJS service ID
    final String _templateId =
        'template_x78tqqj'; // Replace with your EmailJS template ID

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _userId,
          'template_params': {
            'to_name': 'Your Name', // Static or dynamic recipient name
            'from_name': name,
            'from_email': email,
            'from_phone': phone,
            'message': message,
          },
        }),
      );

      if (response.statusCode == 200) {
        print('Email sent successfully');
      } else {
        print('Failed to send email: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
