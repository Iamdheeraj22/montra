import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/dashboard/pages/new_transaction/widgets/amount_bottomsheet.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/dropdown_view.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({
    super.key,
    required this.transactionType,
  });
  final int transactionType;
  static const String id = '/new_transaction_page';
  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  num amount = 0;
  final descriptionController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(type: widget.transactionType),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: getColor(type: widget.transactionType),
        surfaceTintColor: getColor(type: widget.transactionType),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          getTitle(
            type: widget.transactionType,
          ),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<num?>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (ctx) {
                      return AmountBottomSheet();
                    },
                  );
                  if (result != null) {
                    setState(() {
                      amount = result;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: '${AppHeading.hHowMuch}\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColors.light60,
                          ),
                        ),
                        TextSpan(
                          text: '\$ $amount',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 64,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    if (widget.transactionType != 2)
                      DropdownView(
                        items: category,
                        hintText: AppHeading.hCategory,
                        onChanged: (value) {},
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (widget.transactionType == 2) ...[
                      Row(
                        children: [
                          Flexible(
                            child: EditText(
                              controller: descriptionController,
                              hintText: AppHeading.hDescription,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(7),
                            constraints: const BoxConstraints(
                                minWidth: 45,
                                maxWidth: 45,
                                minHeight: 45,
                                maxHeight: 45),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: AppColors.light60)),
                            child: SvgPicture.asset(
                              AppIcons.icTransaction,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: EditText(
                              controller: descriptionController,
                              hintText: AppHeading.hDescription,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                    EditText(
                      controller: descriptionController,
                      hintText: AppHeading.hDescription,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (widget.transactionType != 2)
                      DropdownView(
                        items: category,
                        hintText: AppHeading.hCategory,
                        onChanged: (value) {},
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: DottedBorder(
                          radius: const Radius.circular(10),
                          borderType: BorderType.RRect,
                          color: AppColors.light40,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.rotate(
                                  angle: -150,
                                  child: const Icon(
                                    Icons.attach_file,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  AppHeading.hAddAttachment,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.light20,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHeading.hRepeat,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                AppHeading.hRepeatTransaction,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.light20,
                                ),
                              )
                            ],
                          ),
                          Switch.adaptive(value: false, onChanged: (value) {})
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      onPressed: () {},
                      text: AppHeading.hContinue,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getTitle({required int type}) {
    switch (type) {
      case 1:
        return AppHeading.hIncome;
      case 2:
        return AppHeading.hTransfer;
      case 3:
        return AppHeading.hTotalExpense;
      default:
        return AppHeading.hTotalExpense;
    }
  }

  Color getColor({required int type}) {
    switch (type) {
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blue;
      case 3:
        return AppColors.red;
      default:
        return AppColors.green;
    }
  }

  List<String> category = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4'
  ];
}
