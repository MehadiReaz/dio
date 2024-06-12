import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/controllers/profile_controller.dart';
import 'package:smart_hrm/views/profile/components/user_information.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: selectedIndex, length: 3, vsync: this);
  }

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.getProfile();
    
    return Container(
        alignment: Alignment.center,
        color: Colors.grey[300],
        child: ListView(
          children: [_profile(context), _tabBar(), _indexedStack()],
        ));
  }

  Widget _profile(BuildContext context) => Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                  ),
                ],
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    'assets/icons/profile.png',
                    fit: BoxFit.cover,
                  )),
              // FadeInImage.assetNetwork(
              //     placeholder: 'assets/icons/smart.png',
              //     image: '$url/${profile.image}',
              //     fit: BoxFit.cover
              // ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${controller.profileModel.value.profile != null ? controller.profileModel.value.profile?.name : ""}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
                "${controller.profileModel.value.profile != null ? controller.profileModel.value.profile?.designation?.name : ""}",
                style: TextStyle(fontSize: 12)),
            const SizedBox(
              height: 8,
            ),
            //ProductList(profile.id)
          ],
        ),
      ));

  Container _tabBar() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            _tabController.animateTo(index);
          });
        },
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: Colors.deepOrange,
        ),
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelColor: Colors.black,
        tabs: const [
          Tab(
            text: 'USER INFO',
          ),
          Tab(
            text: 'EDUCATION',
          ),
          Tab(
            text: 'BANK INFO',
          ),
        ],
      ));

  IndexedStack _indexedStack() => IndexedStack(
        index: selectedIndex,
        children: [
          Visibility(
            maintainState: true,
            visible: selectedIndex == 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const UserInformation(),
            ),
          ),
          Visibility(
            maintainState: true,
            visible: selectedIndex == 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              // child: EducationInformation()
            ),
          ),
          Visibility(
            maintainState: true,
            visible: selectedIndex == 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              // child: BankInformation()
            ),
          ),
        ],
      );
}
