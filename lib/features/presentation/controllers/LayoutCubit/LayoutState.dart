abstract class LayoutState {}

class InitialState extends LayoutState {}

class GetUserLoadingState extends LayoutState {}

class GetUserSuccessState extends LayoutState {}

class GetUserErrorState extends LayoutState {
  final String error;

  GetUserErrorState(this.error);
}
class GetBusinessCoursesLoadinState extends LayoutState {}

class GetBusinessCoursesSuccessState extends LayoutState {}

class GetBusinessCoursesErrorState extends LayoutState {
  final String error;

  GetBusinessCoursesErrorState(this.error);
}
class GetDevelopmentCoursesLoadinState extends LayoutState {}

class GetDevelopmentCoursesSuccessState extends LayoutState {}

class GetDevelopmentCoursesErrorState extends LayoutState {
  final String error;

  GetDevelopmentCoursesErrorState(this.error);
}
class GetMarketingCoursesLoadinState extends LayoutState {}

class GetMarketingCoursesSuccessState extends LayoutState {}

class GetMarketingCoursesErrorState extends LayoutState {
  final String error;

  GetMarketingCoursesErrorState(this.error);
}
class GetPersonalDevelopmentCoursesLoadinState extends LayoutState {}

class GetPersonalDevelopmentCoursesSuccessState extends LayoutState {}

class GetPersonalDevelopmentCoursesErrorState extends LayoutState {
  final String error;

  GetPersonalDevelopmentCoursesErrorState(this.error);
}
class GetTeachingAcademicsCoursesLoadinState extends LayoutState {}

class GetTeachingAcademicsCoursesSuccessState extends LayoutState {}

class GetTeachingAcademicsCoursesErrorState extends LayoutState {
  final String error;

  GetTeachingAcademicsCoursesErrorState(this.error);
}class GetLessonCoursesLoadinState extends LayoutState {}

class GetLessonCoursesSuccessState extends LayoutState {}

class GetLessonCoursesErrorState extends LayoutState {
  final String error;

  GetLessonCoursesErrorState(this.error);
}
class RoadmapModelLoadinState extends LayoutState {}

class RoadmapModelSuccessState extends LayoutState {}

class RoadmapModelErrorState extends LayoutState {
  final String error;

  RoadmapModelErrorState(this.error);
}
class ChangeIndexLoadinState extends LayoutState {}

class ChangeIndexSuccessState extends LayoutState {}

class GetRoadmapLoadinState extends LayoutState {}

class GetRoadmapSuccessState extends LayoutState {}

class GetRoadmapErrorState extends LayoutState {
  final String error;

  GetRoadmapErrorState(this.error);
}
class GetAllCoursesLoadinState extends LayoutState {}

class GetAllCoursesSuccessState extends LayoutState {}