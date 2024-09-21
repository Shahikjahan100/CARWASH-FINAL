import 'package:car_wash_light/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  // Function to launch URLs (phone, email, or website) with error handling
  Future<void> _launchUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      // Show an error dialog if launching fails
      _showErrorDialog(context, 'Unable to open $urlString. Error: $e');
    }
  }

  // Function to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(
            color: darkGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: darkGreen,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: darkGreen,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mile High LED Systems',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textWhite,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mile High LED Systems was started by a family who owned car washes and oil change stations. We developed our own line of LED lighting to meet the needs as car wash operators.',
                  style: TextStyle(fontSize: 16, color: textWhite),
                ),
                const SizedBox(height: 20),
                const Text(
                  'We know car wash lighting. Our lights eliminate failure points and increase performance and reliability whether you have a light on a chemical arch or over your pay canopy, we designed light systems to meet the needs of the application. We are Mile High LED Systems and we want to share our product and its benefits with you.',
                  style: TextStyle(fontSize: 16, color: textWhite),
                ),
                const SizedBox(height: 30),
                const Divider(color: textLightGrey),
                const SizedBox(height: 20),
                const Text(
                  'Jeffrey and Michael Call',
                  style: TextStyle(fontSize: 18, color: textWhite),
                ),
                const Text(
                  'Owners of Mile High LED Systems',
                  style: TextStyle(fontSize: 16, color: textLightGrey),
                ),
                const SizedBox(height: 20),

                // Website Link
                _buildInfoRow(
                  context,
                  Icons.link,
                  'MileHighLEDSystems.com',
                  'https://www.milehighledsystems.com',
                ),

                // Car Website Link
                _buildInfoRow(
                  context,
                  Icons.link,
                  'CarWashLights.com',
                  'https://www.carwashlights.com',
                ),

                const SizedBox(height: 30),

                // Phone Number Link
                _buildInfoRow(
                  context,
                  Icons.phone,
                  '800-596-3772',
                  'tel:8005963772',
                ),

                // Email Link
                _buildInfoRow(
                  context,
                  Icons.email,
                  'info@milehighledsystems.com',
                  'mailto:info@milehighledsystems.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String text, String url) {
    return GestureDetector(
      onTap: () => _launchUrl(context, url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: accentGreen),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: textWhite),
            ),
          ],
        ),
      ),
    );
  }
}
