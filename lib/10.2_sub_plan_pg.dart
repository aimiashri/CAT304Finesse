import 'package:flutter/material.dart';
import '10.1_user_acc_pg.dart';

class SubscriptionPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAccountPage(), // Replace with your UserAccountPage class
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    '< Subscription Plan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xFF896CFE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose Your Plan',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildPlanCard(
                        title: 'Free Plan',
                        cost: 'RM 0/month',
                        features: [
                          'Access to limited workout routines.',
                          'Limited tracking features.',
                          'Basic progress reports.',
                          'Access to community forums.',
                          'No offline access.',
                          'Advertisements displayed.',
                        ],
                        onPressed: () {
                          // Add action for Free Plan
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildPlanCard(
                        title: 'Standard Plan',
                        cost: 'RM 29.90/month',
                        features: [
                          'Full access to a wide range of workout routines.',
                          'Customizable workout plans.',
                          'Meal plan recommendations.',
                          'Detailed fitness tracking.',
                          'Weekly and monthly progress reports.',
                          'Offline access to workout videos.',
                          'Fewer or no advertisements.',
                          'Priority customer support.',
                        ],
                        onPressed: () {
                          // Add action for Standard Plan
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildPlanCard(
                        title: 'Premium Plan',
                        cost: 'RM 49.90/month',
                        features: [
                          'Everything in the Standard Plan.',
                          'Access to premium workout programs.',
                          'Advanced meal planning.',
                          'Integration with wearable devices.',
                          'Real-time coaching support.',
                          'Virtual fitness challenges.',
                          'Early access to new features.',
                          'Family sharing.',
                          'Exclusive member-only discounts.',
                        ],
                        onPressed: () {
                          // Add action for Premium Plan
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String cost,
    required List<String> features,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF121212),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cost,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF896CFE),
            ),
          ),
          const SizedBox(height: 10),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Color(0xFF896CFE),
                    size: 16,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                backgroundColor: Color(0xFF896CFE), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}