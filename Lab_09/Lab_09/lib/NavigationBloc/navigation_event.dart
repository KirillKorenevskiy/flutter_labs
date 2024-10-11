abstract class NavigationEvent {}

class NavigationTapped extends NavigationEvent {
  final int index;

  NavigationTapped(this.index);
}
