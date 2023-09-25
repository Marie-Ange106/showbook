part of 'internet_cubit.dart';

enum ConnectivityStatus { connected, disconnected }

class InternetState {
  bool connected;
  bool disconnected;

  InternetState({
    this.connected = false,
    this.disconnected = false,
  });

  InternetState copyWith({
    bool? connected,
    bool? disconnected,
  }) {
    return InternetState(
      connected: connected ?? this.connected,
      disconnected: disconnected ?? this.disconnected,
    );
  }
}
