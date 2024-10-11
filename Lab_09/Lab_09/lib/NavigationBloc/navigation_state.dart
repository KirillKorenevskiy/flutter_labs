abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationPageChanged extends NavigationState {
  final int index;

  NavigationPageChanged(this.index);
}
