module Resource.Route exposing (..)

type alias Route =
  String

type alias Routes =
  {
    top: Route
  , timeline: Route
  , experiment: Route
  }


routes : Routes
routes = {
    top = ""
  , timeline = "timeline"
  , experiment = "experiment"
  }


routePathOf : (Routes -> Route) -> String
routePathOf route = "#/" ++ (route routes)