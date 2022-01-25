import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var list = [];
  int pos = -1;

  RangeValues values = RangeValues(1, 15);

  @override
  void initState() {
    super.initState();
    list = [
      "Information",
      "People",
      "Timeline",
      "Resources",
      "Project Manager"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
              height: MediaQuery.of(context).size.height * .35,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.highlight_rounded,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nuts in America",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "In process",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Public created 02-Sep-2020 12:00AM",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      "Join",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pos = index;
                          setState(() {});
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: pos == index
                                    ? Colors.grey.withOpacity(0.3)
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.only(right: 10),
                            alignment: Alignment.center,
                            child: Text(
                              list[index],
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.withOpacity(0.4),
              width: double.infinity,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: RangeSlider(
                max: 15,
                min: 1,
                values: values,
                onChanged: (RangeValues value) {
                  values = value;
                  setState(() {});
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "End",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "02-Sep 2020",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    "07-Sep 2020",
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.grey.withOpacity(0.4),
              width: double.infinity,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.supervisor_account_sharp,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Members",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Activity",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "-",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.speed,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Score",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.tab_unselected_rounded,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Contributors",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.not_interested,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Risk Factors",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Budget",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "-",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.request_quote_sharp,
                        color: Colors.blue.shade500,
                        size: 30,
                      ),
                      const Text(
                        "Resources",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.messenger_outline_sharp,
                        color: Colors.blue.shade500,
                        size: 30,
                      ),
                      const Text(
                        "Postings",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.grey.withOpacity(0.4),
              width: double.infinity,
              height: 5,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: const Text(
                  "Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus felis elit, aliquam ac nulla pulvinar, iaculis imperdiet erat. Praesent ut augue dignissim, scelerisque odio et, imperdiet lacus. Morbi lacinia metus diam, nec ullamcorper augue posuere quis. Curabitur eu pretium ipsum. Donec pulvinar imperdiet felis. Integer at odio massa. Morbi at sagittis felis. Etiam placerat ut augue a vehicula. Ut faucibus condimentum vehicula. Donec vel euismod diam, in pharetra dolor.",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey.withOpacity(0.8)),
                )),
          ],
        ),
      ),
    );
  }
}
