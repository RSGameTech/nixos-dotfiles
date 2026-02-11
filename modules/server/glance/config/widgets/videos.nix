# {
#   type = "videos";
#   style = "vertical-list";
#   collapse-after = 4;
#   limit = 12;
#   channels = [
#     "UCAbAsEZ-0LccTNbl8r-3EaQ" # Scott Yu-Jan | @ScottYuJan
#     "UCovagaiL6pBYWfvThaXVniA" # Samuel Nam   | @thesamuelnam
#     "UC_zBdZ0_H_jn41FDRG7q4Tw" # Vimjoyer     | @vimjoyer
#   ];
# }

let
  channelList = [
    "UCAbAsEZ-0LccTNbl8r-3EaQ" # Scott Yu-Jan | @ScottYuJan
    "UCovagaiL6pBYWfvThaXVniA" # Samuel Nam   | @thesamuelnam
    "UC_zBdZ0_H_jn41FDRG7q4Tw" # Vimjoyer     | @vimjoyer
  ];

  channelEntries = builtins.map (channel: {
    type = "videos";
    channels = [channel];
    style = "horizontal-cards";
    # collapse-after = 4;
    limit = 10;
  }) channelList;
in {
  type = "group";
  widgets = channelEntries;
}