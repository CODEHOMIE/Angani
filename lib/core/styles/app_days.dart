class AppDays {
  String dayType(int _day) {
      switch (_day) {
        case 0:
          return 'Monday';
        case 1:
          return 'Tuesday';
        case 2:
          return 'Wednesday';
        case 3:
          return 'Thursday';
        case 4:
          return 'Friday';
      }
      return '';
    }
}