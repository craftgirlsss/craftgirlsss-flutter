import 'dart:async';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardroductflashsale.dart';
import 'package:flutter/material.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  FlashSaleState createState() => FlashSaleState();
}

class FlashSaleState extends State<FlashSale> {
  static var countdownDuration = const Duration(minutes: 10);
  static var countdownDuration1 = const Duration(minutes: 10);
  Duration duration = const Duration();
  Duration duration1 = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer?.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void startTimer1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime1());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void addTime1() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    var hours = int.parse("00");
    var mints = int.parse("00");
    var secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();

    var hours1 = int.parse("10");
    var mints1 = int.parse("00");
    var secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/flashsale.png',
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error');
                      },
                    ),
                    const SizedBox(width: 7),
                    buildTime1()
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Lihat semua",
                      style: TextStyle(fontFamily: 'Inter'),
                    ))
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return cardFlashsale(
                        onTap: () {},
                        productName: "Hello world",
                        percentDiscount: 20);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 7);
                  },
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(
        time: minutes,
      ),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(
        time: seconds,
      ),
    ]);
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours),
      const Text(
        ' : ',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      buildTimeCard(time: minutes),
      const Text(
        ' : ',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      buildTimeCard(time: seconds),
    ]);
  }

  Widget buildTimeCard({required String time}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(6)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10),
            ),
          ),
        ],
      );
}
