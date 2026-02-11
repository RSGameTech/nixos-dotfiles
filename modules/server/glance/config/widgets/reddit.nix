let
  subList = [
    "homelabindia"
    "HardwareIndia"
    "iemIndia"
  ];

  subredditEntries = builtins.map (sub: {
    type = "reddit";
    subreddit = sub;
    style = "vertical-list";
    show-thumbnails = true;
    sort-by = "top";
    top-period = "day";
    limit = 16;
    collapse-after = 4;
  }) subList;
in {
  type = "group";
  widgets = subredditEntries;
}