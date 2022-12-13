abstract class NewsState{}

class NewsBottomNav extends NewsState{}

class NewsInitialState extends NewsState{}

class NewsAppBarText extends NewsState{}

class NewsGetBusienessSuccessState extends NewsState{}
class NewsGetBusienessErrorState extends NewsState{
  final String error;

  NewsGetBusienessErrorState(this.error);
}
class NewsGetBusienessLoadingState extends NewsState{}

class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{
  final String error;

  NewsGetSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsState{}

class NewsGetGeneralSuccessState extends NewsState{}
class NewsGetGeneralErrorState extends NewsState{
  final String error;

  NewsGetGeneralErrorState(this.error);
}
class NewsGetGeneralLoadingState extends NewsState{}

class NewsGetHealthSuccessState extends NewsState{}
class NewsGetHealthErrorState extends NewsState{
  final String error;

  NewsGetHealthErrorState(this.error);
}
class NewsGetHealthLoadingState extends NewsState{}

class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{
  final String error;

  NewsGetScienceErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsState{}

class NewsGetTechnologySuccessState extends NewsState{}
class NewsGetTechnologyErrorState extends NewsState{
  final String error;

  NewsGetTechnologyErrorState(this.error);
}
class NewsGetTechnologyLoadingState extends NewsState{}

class NewsGetSearchSuccessState extends NewsState{}
class NewsGetSearchErrorState extends NewsState{
  final String error;

  NewsGetSearchErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsState{}