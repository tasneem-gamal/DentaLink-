import 'package:dentalink/core/di/dependency_injection.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/ai_scan_view.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/chat_view.dart';
import 'package:dentalink/features/auth/forgot_password/logic/change_password_cubit/change_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/ui/change_password_view.dart';
import 'package:dentalink/features/auth/forgot_password/ui/forgot_password_otp_view.dart';
import 'package:dentalink/features/auth/forgot_password/ui/forgot_password_view.dart';
import 'package:dentalink/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:dentalink/features/auth/login/ui/login_view.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:dentalink/features/auth/sign_up/ui/sign_up_view.dart';
import 'package:dentalink/features/cart/ui/widgets/cart_view_body.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_confirm/checkout_confirm.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_pay/checkout_pay_view.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/order_details_view.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/logic/add_patient_cubit/add_patient_cubit.dart';
import 'package:dentalink/features/home/logic/all_patients_cubit/all_patients_cubit.dart';
import 'package:dentalink/features/home/logic/all_tools_cubit/all_tools_cubit.dart';
import 'package:dentalink/features/home/logic/latest_patients_cubit/latest_patients_cubit.dart';
import 'package:dentalink/features/home/logic/new_in_tools_cubit/new_in_tools_cubit.dart';
import 'package:dentalink/features/home/logic/related_tools_cubit/related_tools_cubit.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/logic/search_history_cubit/search_history_cubit.dart';
import 'package:dentalink/features/home/ui/home_view.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/exchange_view.dart';
import 'package:dentalink/features/home/ui/widgets/favorites/favorites_view.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/add_patient_view.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/add_tool_view.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/patient_details_view.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patients_view.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/reviews_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/specific_shop/specific_shop_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/tool_details_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tools_view.dart';
import 'package:dentalink/features/on_boarding/on_boarding_view.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_get_started.dart';
import 'package:dentalink/features/profile/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:dentalink/features/profile/profile_view.dart';
import 'package:dentalink/features/profile/ui/widgets/about_us/about_us_view.dart';
import 'package:dentalink/features/profile/ui/widgets/all_orders/all_orders_view.dart';
import 'package:dentalink/features/profile/ui/widgets/edit_profile/edit_profile_view.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/my_posts_view.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/my_posts_patients_view.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/my_posts_tools_view.dart';
import 'package:dentalink/features/profile/ui/widgets/privacy_policy.dart/privacy_policy_view.dart';
import 'package:dentalink/features/profile/ui/widgets/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:dentalink/features/shop/ui/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // on boarding view
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.onBoardingGetStartedView:
        return MaterialPageRoute(builder: (_) => const OnBoardingGetStarted());

      //login
      case Routes.loginView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginView(),
                ));

      case Routes.forgotPasswordView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FogotPasswordCubit>(),
                  child: const ForgotPasswordView(),
                ));

      case Routes.forgotPasswordOtpView:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<FogotPasswordCubit>()),
              BlocProvider(create: (context) => getIt<VerifyOtpCubit>()),
              BlocProvider(create: (context) => getIt<ResendOtpCubit>()),
            ],
            child: const ForgotPasswordOtpView(),
          ),
        );

      case Routes.changePasswordView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ChangePasswordCubit>(),
                  child: const ChangePasswordView(),
                ));
      //sign
      case Routes.signUpView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignCubit>(),
                  child: const SignUpView(),
                ));

      // home and related
      case Routes.homeView:
        final patientData = settings.arguments as List<PatientData>? ?? [];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            getIt<LatestPatientsCubit>()..getLatestPatients(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<NewInToolsCubit>()..getNewInTools(),
                      ),
                      BlocProvider(create: (context) => getIt<SignOutCubit>()),
                    ],
                    child: HomeView(
                      patientData: patientData,
                    )));

      case Routes.addPatient:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AddPatientCubit>(),
                  child: const AddPatientView(),
                ));

      case Routes.addTool:
        return MaterialPageRoute(builder: (_) => const AddToolView());

      case Routes.patientsView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AllPatientsCubit>()..getPatients(),
                  child: const PatientsView(),
                ));

      case Routes.toolsView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AllToolsCubit>()..getTools(),
                  child: const ToolsView(),
                ));

      case Routes.patientDetails:
        final patientData = settings.arguments as PatientData;
        return MaterialPageRoute(
            builder: (_) => PatientDetailsView(
                  patientData: patientData,
                ));

      case Routes.toolDetails:
        final toolData = settings.arguments as ToolData;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RelatedToolsCubit>()..getRelatedTools(toolData),
                  child: ToolDetailsView(
                    toolData: toolData,
                  ),
                ));

      case Routes.reviewsView:
        return MaterialPageRoute(builder: (_) => const ReviewsView());

      case Routes.searchView:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<SearchCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<SearchHistoryCubit>(),
                    ),
                  ],
                  child: const SearchView(),
                ));

      case Routes.specificShopView:
        return MaterialPageRoute(builder: (_) => const SpecificShopView());

      case Routes.exchangeView:
        return MaterialPageRoute(builder: (_) => const ExchangeView());

      case Routes.favoritesView:
        return MaterialPageRoute(builder: (_) => const FavoritesView());

      //shop and related
      case Routes.shopView:
        return MaterialPageRoute(builder: (_) => const ShopView());

      //cart and related
      case Routes.cartView:
        return MaterialPageRoute(builder: (_) => const CartViewBody());

      case Routes.checkoutConfirmView:
        return MaterialPageRoute(builder: (_) => const CheckoutConfirm());

      case Routes.checkoutPayView:
        return MaterialPageRoute(builder: (_) => const CheckoutPayView());

      case Routes.orderDetailsView:
        return MaterialPageRoute(builder: (_) => const OrderDetailsView());

      //profile and related
      case Routes.profileView:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      case Routes.aboutUsView:
        return MaterialPageRoute(builder: (_) => const AboutUsView());

      case Routes.privacyPolicyView:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());

      case Routes.termsAndConditionsView:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsView());

      case Routes.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());

      case Routes.myPostsView:
        return MaterialPageRoute(builder: (_) => const MyPostsView());

      case Routes.myPostsToolsView:
        return MaterialPageRoute(builder: (_) => const MyPostsToolsView());

      case Routes.myPostspatientsView:
        return MaterialPageRoute(builder: (_) => const MyPostsPatientsView());

      case Routes.allOrdersView:
        return MaterialPageRoute(builder: (_) => const AllOrdersView());

      //AI scan
      case Routes.aiScanView:
        return MaterialPageRoute(builder: (_) => const AiScanView());

      case Routes.chatView:
        return MaterialPageRoute(builder: (_) => const ChatView());

      default:
        return null;
    }
  }
}
