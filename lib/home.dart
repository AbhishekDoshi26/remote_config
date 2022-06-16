import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:remote_config/remote_config_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    message = dotenv.get(await RemoteConfigService.fetchConfig());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
