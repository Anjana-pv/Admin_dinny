import 'package:flutter/material.dart';

class AdminPrivacyPolicyScreen extends StatelessWidget {
  const AdminPrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Privacy Policy for Ourdinny'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'At Ourdinny, we prioritize the privacy of our users. This Privacy Policy document contains types of information that is collected and recorded by Ourdinny and how we use it.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Collection of Personal Information',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          ListTile(
            title: Text('Username: We collect usernames to uniquely identify users within our system.'),
          ),
          ListTile(
            title: Text('Password: Passwords are collected to secure user accounts and ensure account integrity.'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Use of Personal Information',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          ListTile(
            title: Text('User Authentication: Usernames and passwords are used for authenticating users and securing their accounts.'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Data Security',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Ourdinny takes reasonable precautions to protect user information. However, no method of transmission over the internet, or method of electronic storage, is 100% secure. Therefore, while we strive to use commercially acceptable means to protect user information, we cannot guarantee its absolute security.',
          ),
          SizedBox(height: 16.0),
          Text(
            'Changes to Privacy Policy',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Ourdinny reserves the right to update or change our Privacy Policy at any time. Users will be notified of any changes by posting the new Privacy Policy on this page.',
          ),
          SizedBox(height: 16.0),
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'If you have any questions about this Privacy Policy, please contact us at ourdinnyofficial@gmail.com.',
          ),
          SizedBox(height: 16.0),
          Text(
            'By using Ourdinny, you agree to the collection and use of information in accordance with this policy.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

 