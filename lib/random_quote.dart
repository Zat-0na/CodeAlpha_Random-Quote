import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/Models/quotes_data.dart';

class RandomGenerator extends StatefulWidget {
  const RandomGenerator({super.key});

  @override
  State<RandomGenerator> createState() => _RandomGeneratorState();
}

class _RandomGeneratorState extends State<RandomGenerator> {
  final Dio dio = Dio();

  QuoteModel? currentQuote;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  Future<void> getRandomQuote() async {
    setState(() {
      isLoading = true;
    });
    final response = await dio.get('https://dummyjson.com/quotes');
    final List<QuoteModel> quotes = QuoteModel.fromJsonList(response.data);
    setState(() {
      currentQuote = quotes[Random().nextInt(quotes.length)];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/205_LE_upscale_prime.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 151, 124, 199),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ' Quote Generator ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 5),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.8),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentQuote?.quote ?? 'No quote yet',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '- ${currentQuote?.author ?? ''}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
              const Spacer(flex: 13),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: isLoading ? null : getRandomQuote,
                child: const Text(
                  'New Quote',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ],
      ),
    );
  }
}
