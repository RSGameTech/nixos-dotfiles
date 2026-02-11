{
  config,
  ...
}: let
  widgetPath = ./widgets;
  widgets = {
    clock = import (widgetPath + /clock.nix);
    weather = import (widgetPath + /weather.nix);
    calendar = import (widgetPath + /calendar.nix);
    videos = import (widgetPath + /videos.nix);
    reddit = import (widgetPath + /reddit.nix);
    releases = import (widgetPath + /releases.nix);
    # ... add more widgets here
  };
in [
  {
    name = "Home";
    columns = [
      {
        size = "small";
        widgets = [
          widgets.calendar
          widgets.clock
          widgets.weather
        ];
      }
      {
        size = "full";
        widgets = [
          widgets.videos
          widgets.reddit
        ];
      }
      {
        size = "small";
        widgets = [
          widgets.releases
        ];
      }
    ];
  }
]