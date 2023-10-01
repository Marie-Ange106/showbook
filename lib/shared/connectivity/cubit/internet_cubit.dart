// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// part 'internet_state.dart';

// class InternetCubit extends Cubit<InternetState> {
//   final Connectivity connectivity;
//   InternetCubit({required this.connectivity}) : super(InternetState());

//   checkInternet() {
//     connectivity.onConnectivityChanged.listen((connectivityResult) {
//       if (connectivityResult == ConnectivityResult.none) {
//         emit(
//           state.copyWith(
//             connected: false,
//             disconnected: true,
//           ),
//         );
//       } else {
//         emit(
//           state.copyWith(
//             connected: true,
//             disconnected: false,
//           ),
//         );
//       }
//     });
//   }
// }
