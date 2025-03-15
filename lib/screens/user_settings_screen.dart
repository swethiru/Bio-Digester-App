import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool isEditing = false; // ✅ Toggle View/Edit Mode

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<UserProvider>(context); // ✅ Get logged-in user data

    // ✅ Controllers initialized with logged-in user details
    TextEditingController fullNameController =
        TextEditingController(text: user.fullName);
    TextEditingController positionController =
        TextEditingController(text: user.position);
    TextEditingController emailController =
        TextEditingController(text: user.email);
    TextEditingController phoneController =
        TextEditingController(text: user.phone);
    TextEditingController departmentController =
        TextEditingController(text: user.department);
    TextEditingController locationController =
        TextEditingController(text: user.location);

    return Scaffold(
      appBar: AppBar(title: const Text("User Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // ✅ View or Edit Mode
            isEditing ? buildEditableFields(user) : buildViewFields(user),

            const SizedBox(height: 20),

            // ✅ Edit / Save Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isEditing) {
                    saveProfile(
                        user,
                        fullNameController,
                        positionController,
                        emailController,
                        phoneController,
                        departmentController,
                        locationController);
                  }
                  isEditing = !isEditing;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(isEditing ? "Save Changes" : "Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ View Mode
  Widget buildViewFields(UserProvider user) {
    return Column(
      children: [
        buildInfoRow("Full Name", user.fullName),
        buildInfoRow("Position", user.position),
        buildInfoRow("Email", user.email),
        buildInfoRow("Phone", user.phone),
        buildInfoRow("Department", user.department),
        buildInfoRow("Location", user.location),
      ],
    );
  }

  // ✅ Edit Mode
  Widget buildEditableFields(UserProvider user) {
    return Column(
      children: [
        buildInputField("Full Name", user.fullName),
        buildInputField("Position", user.position),
        buildInputField("Email", user.email),
        buildInputField("Phone", user.phone),
        buildInputField("Department", user.department),
        buildInputField("Location", user.location),
      ],
    );
  }

  // ✅ Update User Data and Save
  void saveProfile(
      UserProvider user,
      TextEditingController name,
      TextEditingController pos,
      TextEditingController mail,
      TextEditingController ph,
      TextEditingController dept,
      TextEditingController loc) {
    user.updateUser(
        name.text, pos.text, mail.text, ph.text, dept.text, loc.text);
  }

  // ✅ UI Helpers
  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
