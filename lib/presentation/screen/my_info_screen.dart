import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controller/user_info_controller.dart';
import '../screen/edit_info_screen.dart';

class MyInfoScreen extends GetView<UserInfoController> {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final userInfo = controller.userInfo.value;
        if (userInfo == null) {
          return const Center(child: Text('사용자 정보를 불러올 수 없습니다.'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 29,
                          height: 32,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              'assets/icons/backarrow_blue.svg',
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ),
                        // Text(
                        //   '$userType 로그인',
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: AppTheme.blue500,
                        //     fontSize: 22,
                        //     fontFamily: 'Pretendard',
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        // ),
                        const SizedBox(
                          width: 29,
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
                // Profile image and edit button
                SizedBox(
                  width: 133,
                  height: 133,
                  child: Stack(
                    children: [
                      Container(
                        width: 133,
                        height: 133,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 5,
                        child: Container(
                          width: 122,
                          height: 122,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: Image.asset(
                                'assets/images/character1.png',
                              ).image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5.5,
                        bottom: 6,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => EditInfoScreen());
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(885.35),
                            ),
                            child: const Icon(Icons.edit, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Name and ID
                Column(
                  children: [
                    Text(
                      userInfo.userName,
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 24,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Text(
                      '사번: ${userInfo.employeeNumber}',
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      _buildInfoRow('소속', userInfo.departmentName),
                      const SizedBox(height: 32),
                      _buildInfoRow('직무그룹', userInfo.departmentGroupName),
                      const SizedBox(height: 32),
                      _buildInfoRow('레벨', userInfo.levelName),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 18,
                  decoration: const BoxDecoration(color: Color(0xFFDCEBFF)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      _buildInfoRow('아이디', userInfo.userId),
                      const SizedBox(height: 32),
                      _buildPasswordRow(),
                      const SizedBox(height: 54),
                    ],
                  ),
                ),

                // Logout button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 51,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '로그아웃',
                        style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 19,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF212529),
            fontSize: 20,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF212529),
            fontSize: 20,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '비밀번호',
          style: TextStyle(
            color: Color(0xFF212529),
            fontSize: 20,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            const Text(
              '11•••',
              style: TextStyle(
                color: Color(0xFF212529),
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 57,
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: ShapeDecoration(
                color: const Color(0x91B5D4FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Center(
                child: Text(
                  '수정',
                  style: TextStyle(
                    color: Color(0xFF093F86),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
