---
title: "Makeover Monday 04/11/2019 Las Vegas Convention Attendance & Visitor Traffic"
excerpt_separator: "<!--more-->"
categories:
  - Makeover Monday
tags:
  - Makeover Monday
  - Bar plots
  - Line plots
  - altair
  - python
altair: true
---

# 2019/W45: Las Vegas Convention Attendance & Visitor Traffic

Data from [here](https://data.world/makeovermonday/2019w45)

# Interactive plot

<div id="vis"></div>
<script>
    (function(vegaEmbed) {
      var spec = {"config": {"view": {"width": 400, "height": 300, "strokeWidth": 0}, "mark": {"tooltip": null}, "axis": {"domain": false, "grid": false, "labelColor": "dimgray", "titleColor": "dimgray", "titleFontSize": 13, "titleFontWeight": "normal"}, "background": "Snow", "title": {"anchor": "middle", "color": "darkslategray", "fontSize": 15}}, "hconcat": [{"vconcat": [{"mark": {"type": "line", "point": true, "size": 3}, "encoding": {"color": {"condition": {"value": "darkblue", "selection": "selector010"}, "value": "gray"}, "tooltip": {"type": "nominal", "field": "Year", "timeUnit": "year"}, "x": {"type": "temporal", "field": "Year", "title": null}, "y": {"type": "quantitative", "axis": {"format": "~s"}, "field": "Convention Attendance", "title": "Number of attendees"}}, "height": 93.33333333333333, "selection": {"selector010": {"type": "interval", "encodings": ["x"], "empty": "all"}}, "title": "Convention Attendance", "width": 400}, {"mark": {"type": "line", "point": true, "size": 3}, "encoding": {"color": {"condition": {"value": "darkblue", "selection": "selector010"}, "value": "gray"}, "tooltip": {"type": "nominal", "field": "Year", "timeUnit": "year"}, "x": {"type": "temporal", "field": "Year", "title": null}, "y": {"type": "quantitative", "axis": {"format": "~s"}, "field": "Visitor Volume", "title": "Number of visitors"}}, "height": 300, "selection": {"selector010": {"type": "interval", "encodings": ["x"], "empty": "all"}}, "title": "Visitor Volume", "width": 400}]}, {"vconcat": [{"mark": "bar", "encoding": {"color": {"condition": {"value": "darkblue", "selection": "selector010"}, "value": "gray"}, "tooltip": {"type": "nominal", "field": "Year", "timeUnit": "year"}, "x": {"type": "temporal", "field": "Year", "title": null}, "y": {"type": "quantitative", "axis": {"format": "%"}, "field": "Proportion", "title": null}}, "height": 93.33333333333333, "selection": {"selector010": {"type": "interval", "encodings": ["x"], "empty": "all"}}, "title": "Share of Visitors from Conventions", "width": 400}, {"mark": {"type": "line", "point": true, "size": 3}, "encoding": {"color": {"condition": {"value": "darkgreen", "selection": "selector010"}, "value": "gray"}, "tooltip": {"type": "nominal", "field": "Year", "timeUnit": "year"}, "x": {"type": "temporal", "field": "Year", "title": null}, "y": {"type": "quantitative", "axis": {"format": "~s"}, "field": "Clark County Gaming Revenue", "title": "Dollars"}}, "height": 300, "selection": {"selector010": {"type": "interval", "encodings": ["x"], "empty": "all"}}, "title": "Clark County Gaming Revenue", "width": 400}]}], "data": {"name": "data-271204d0ee93e75baddc369f949e4d49"}, "title": "Las Vegas Visitors Info 1979 - 2019(October)", "$schema": "https://vega.github.io/schema/vega-lite/v3.4.0.json", "datasets": {"data-271204d0ee93e75baddc369f949e4d49": [{"Year": "1970-01-01T00:00:00", "Months": 12, "Visitor Volume": 6787650, "Convention Attendance": 269129, "Room Inventory": 25430, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 68.0, "LVCVA Room Tax Collections": 3751265.0, "En/Deplaned Air Passenger": 4086973, "Clark County Gaming Revenue": 369286977, "Proportion": 0.03964980516084359}, {"Year": "1971-01-01T00:00:00", "Months": 12, "Visitor Volume": 7361783, "Convention Attendance": 312347, "Room Inventory": 26044, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 78.3, "LVCVA Room Tax Collections": 4241630.0, "En/Deplaned Air Passenger": 4102285, "Clark County Gaming Revenue": 399410972, "Proportion": 0.04242817263154863}, {"Year": "1972-01-01T00:00:00", "Months": 12, "Visitor Volume": 7954748, "Convention Attendance": 290794, "Room Inventory": 26619, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 81.2, "LVCVA Room Tax Collections": 4770716.0, "En/Deplaned Air Passenger": 4608764, "Clark County Gaming Revenue": 476126720, "Proportion": 0.036556029179051305}, {"Year": "1973-01-01T00:00:00", "Months": 12, "Visitor Volume": 8474727, "Convention Attendance": 357248, "Room Inventory": 29198, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 84.4, "LVCVA Room Tax Collections": 5556312.0, "En/Deplaned Air Passenger": 5397017, "Clark County Gaming Revenue": 588221779, "Proportion": 0.04215451423980973}, {"Year": "1974-01-01T00:00:00", "Months": 12, "Visitor Volume": 8664751, "Convention Attendance": 311908, "Room Inventory": 32826, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 78.7, "LVCVA Room Tax Collections": 6559315.0, "En/Deplaned Air Passenger": 5944433, "Clark County Gaming Revenue": 684714502, "Proportion": 0.03599734141234988}, {"Year": "1975-01-01T00:00:00", "Months": 12, "Visitor Volume": 9151427, "Convention Attendance": 349787, "Room Inventory": 35190, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 79.5, "LVCVA Room Tax Collections": 7616661.0, "En/Deplaned Air Passenger": 6500806, "Clark County Gaming Revenue": 770336695, "Proportion": 0.03822212645088029}, {"Year": "1976-01-01T00:00:00", "Months": 12, "Visitor Volume": 9769354, "Convention Attendance": 367322, "Room Inventory": 36245, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 82.0, "LVCVA Room Tax Collections": 8890463.0, "En/Deplaned Air Passenger": 7685817, "Clark County Gaming Revenue": 845975652, "Proportion": 0.037599415478239404}, {"Year": "1977-01-01T00:00:00", "Months": 12, "Visitor Volume": 10137021, "Convention Attendance": 417090, "Room Inventory": 39350, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 80.8, "LVCVA Room Tax Collections": 10383259.0, "En/Deplaned Air Passenger": 7964687, "Clark County Gaming Revenue": 1015463342, "Proportion": 0.04114522402587506}, {"Year": "1978-01-01T00:00:00", "Months": 12, "Visitor Volume": 11178111, "Convention Attendance": 607318, "Room Inventory": 42620, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 82.0, "LVCVA Room Tax Collections": 13113511.0, "En/Deplaned Air Passenger": 9110842, "Clark County Gaming Revenue": 1236235456, "Proportion": 0.054331004585658524}, {"Year": "1979-01-01T00:00:00", "Months": 12, "Visitor Volume": 11696073, "Convention Attendance": 637862, "Room Inventory": 45035, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 80.9, "LVCVA Room Tax Collections": 15847040.0, "En/Deplaned Air Passenger": 10574127, "Clark County Gaming Revenue": 1423620102, "Proportion": 0.054536424319513055}, {"Year": "1980-01-01T00:00:00", "Months": 12, "Visitor Volume": 11941524, "Convention Attendance": 656024, "Room Inventory": 45815, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 77.2, "LVCVA Room Tax Collections": 18231548.0, "En/Deplaned Air Passenger": 10302106, "Clark County Gaming Revenue": 1617194799, "Proportion": 0.05493637160550027}, {"Year": "1981-01-01T00:00:00", "Months": 12, "Visitor Volume": 11820788, "Convention Attendance": 719988, "Room Inventory": 49614, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 75.7, "LVCVA Room Tax Collections": 18179761.0, "En/Deplaned Air Passenger": 9469727, "Clark County Gaming Revenue": 1676148606, "Proportion": 0.060908629780011284}, {"Year": "1982-01-01T00:00:00", "Months": 12, "Visitor Volume": 11633728, "Convention Attendance": 809779, "Room Inventory": 50270, "Midweek Occupancy Percentage": null, "Weekend Occupancy Percentage": null, "Overall Occupancy Percentage": 70.3, "LVCVA Room Tax Collections": 19070664.0, "En/Deplaned Air Passenger": 9438648, "Clark County Gaming Revenue": 1751421394, "Proportion": 0.06960614860515907}, {"Year": "1983-01-01T00:00:00", "Months": 12, "Visitor Volume": 12348270, "Convention Attendance": 943611, "Room Inventory": 52529, "Midweek Occupancy Percentage": 67.1, "Weekend Occupancy Percentage": 86.9, "Overall Occupancy Percentage": 72.6, "LVCVA Room Tax Collections": 21731353.0, "En/Deplaned Air Passenger": 10312842, "Clark County Gaming Revenue": 1887451717, "Proportion": 0.07641645347890838}, {"Year": "1984-01-01T00:00:00", "Months": 12, "Visitor Volume": 12843433, "Convention Attendance": 1050916, "Room Inventory": 54129, "Midweek Occupancy Percentage": 66.4, "Weekend Occupancy Percentage": 88.3, "Overall Occupancy Percentage": 72.5, "LVCVA Room Tax Collections": 23921313.0, "En/Deplaned Air Passenger": 10141809, "Clark County Gaming Revenue": 2008155460, "Proportion": 0.08182516310086252}, {"Year": "1985-01-01T00:00:00", "Months": 12, "Visitor Volume": 14194189, "Convention Attendance": 1072629, "Room Inventory": 53067, "Midweek Occupancy Percentage": 74.7, "Weekend Occupancy Percentage": 93.0, "Overall Occupancy Percentage": 79.8, "LVCVA Room Tax Collections": 26956881.0, "En/Deplaned Air Passenger": 10924047, "Clark County Gaming Revenue": 2256762736, "Proportion": 0.07556817793535087}, {"Year": "1986-01-01T00:00:00", "Months": 12, "Visitor Volume": 15196284, "Convention Attendance": 1519421, "Room Inventory": 56494, "Midweek Occupancy Percentage": 76.8, "Weekend Occupancy Percentage": 93.5, "Overall Occupancy Percentage": 81.4, "LVCVA Room Tax Collections": 30587141.0, "En/Deplaned Air Passenger": 12428748, "Clark County Gaming Revenue": 2431237168, "Proportion": 0.0999863519265631}, {"Year": "1987-01-01T00:00:00", "Months": 12, "Visitor Volume": 16216102, "Convention Attendance": 1677716, "Room Inventory": 58474, "Midweek Occupancy Percentage": 79.2, "Weekend Occupancy Percentage": 94.5, "Overall Occupancy Percentage": 83.4, "LVCVA Room Tax Collections": 34443765.0, "En/Deplaned Air Passenger": 15582302, "Clark County Gaming Revenue": 2789336000, "Proportion": 0.10345988203576914}, {"Year": "1988-01-01T00:00:00", "Months": 12, "Visitor Volume": 17199808, "Convention Attendance": 1702158, "Room Inventory": 61394, "Midweek Occupancy Percentage": 81.4, "Weekend Occupancy Percentage": 93.5, "Overall Occupancy Percentage": 85.1, "LVCVA Room Tax Collections": 38175535.0, "En/Deplaned Air Passenger": 16231199, "Clark County Gaming Revenue": 3136901000, "Proportion": 0.09896377913055773}, {"Year": "1989-01-01T00:00:00", "Months": 12, "Visitor Volume": 18129684, "Convention Attendance": 1508842, "Room Inventory": 67391, "Midweek Occupancy Percentage": 81.6, "Weekend Occupancy Percentage": 94.0, "Overall Occupancy Percentage": 85.2, "LVCVA Room Tax Collections": 40528245.0, "En/Deplaned Air Passenger": 17106948, "Clark County Gaming Revenue": 3430851000, "Proportion": 0.08322494755010622}, {"Year": "1990-01-01T00:00:00", "Months": 12, "Visitor Volume": 20954420, "Convention Attendance": 1742194, "Room Inventory": 73730, "Midweek Occupancy Percentage": 80.9, "Weekend Occupancy Percentage": 93.6, "Overall Occupancy Percentage": 84.7, "LVCVA Room Tax Collections": 49493569.0, "En/Deplaned Air Passenger": 19089684, "Clark County Gaming Revenue": 4104001000, "Proportion": 0.0831420769460572}, {"Year": "1991-01-01T00:00:00", "Months": 12, "Visitor Volume": 21315116, "Convention Attendance": 1794444, "Room Inventory": 76879, "Midweek Occupancy Percentage": 76.0, "Weekend Occupancy Percentage": 89.8, "Overall Occupancy Percentage": 80.3, "LVCVA Room Tax Collections": 49396226.0, "En/Deplaned Air Passenger": 20171969, "Clark County Gaming Revenue": 4152407000, "Proportion": 0.08418645246875504}, {"Year": "1992-01-01T00:00:00", "Months": 12, "Visitor Volume": 21886865, "Convention Attendance": 1969435, "Room Inventory": 76523, "Midweek Occupancy Percentage": 80.4, "Weekend Occupancy Percentage": 92.0, "Overall Occupancy Percentage": 83.9, "LVCVA Room Tax Collections": 52259477.0, "En/Deplaned Air Passenger": 20912585, "Clark County Gaming Revenue": 4381710000, "Proportion": 0.08998250777349794}, {"Year": "1993-01-01T00:00:00", "Months": 12, "Visitor Volume": 23522593, "Convention Attendance": 2439734, "Room Inventory": 86053, "Midweek Occupancy Percentage": 84.6, "Weekend Occupancy Percentage": 94.2, "Overall Occupancy Percentage": 87.6, "LVCVA Room Tax Collections": 56125234.0, "En/Deplaned Air Passenger": 22492156, "Clark County Gaming Revenue": 4727424000, "Proportion": 0.10371875243515882}, {"Year": "1994-01-01T00:00:00", "Months": 12, "Visitor Volume": 28214362, "Convention Attendance": 2684171, "Room Inventory": 88560, "Midweek Occupancy Percentage": 86.5, "Weekend Occupancy Percentage": 94.4, "Overall Occupancy Percentage": 89.0, "LVCVA Room Tax Collections": 76876787.0, "En/Deplaned Air Passenger": 26850486, "Clark County Gaming Revenue": 5430651000, "Proportion": 0.09513491745799534}, {"Year": "1995-01-01T00:00:00", "Months": 12, "Visitor Volume": 29002122, "Convention Attendance": 2924879, "Room Inventory": 90046, "Midweek Occupancy Percentage": 85.6, "Weekend Occupancy Percentage": 93.5, "Overall Occupancy Percentage": 88.0, "LVCVA Room Tax Collections": 82135745.0, "En/Deplaned Air Passenger": 28027239, "Clark County Gaming Revenue": 5717567000, "Proportion": 0.10085051707595741}, {"Year": "1996-01-01T00:00:00", "Months": 12, "Visitor Volume": 29636361, "Convention Attendance": 3305507, "Room Inventory": 99072, "Midweek Occupancy Percentage": 88.7, "Weekend Occupancy Percentage": 94.4, "Overall Occupancy Percentage": 90.4, "LVCVA Room Tax Collections": 91565876.0, "En/Deplaned Air Passenger": 30459965, "Clark County Gaming Revenue": 5783735000, "Proportion": 0.11153552219181026}, {"Year": "1997-01-01T00:00:00", "Months": 12, "Visitor Volume": 30464635, "Convention Attendance": 3519424, "Room Inventory": 105347, "Midweek Occupancy Percentage": 84.1, "Weekend Occupancy Percentage": 91.6, "Overall Occupancy Percentage": 86.4, "LVCVA Room Tax Collections": 98186440.0, "En/Deplaned Air Passenger": 30315094, "Clark County Gaming Revenue": 6152415000, "Proportion": 0.11552490289150026}, {"Year": "1998-01-01T00:00:00", "Months": 12, "Visitor Volume": 30605128, "Convention Attendance": 3301705, "Room Inventory": 109365, "Midweek Occupancy Percentage": 83.0, "Weekend Occupancy Percentage": 92.1, "Overall Occupancy Percentage": 85.8, "LVCVA Room Tax Collections": 100468931.0, "En/Deplaned Air Passenger": 30227287, "Clark County Gaming Revenue": 6346958000, "Proportion": 0.10788077736515267}, {"Year": "1999-01-01T00:00:00", "Months": 12, "Visitor Volume": 33809134, "Convention Attendance": 3772726, "Room Inventory": 120294, "Midweek Occupancy Percentage": 85.6, "Weekend Occupancy Percentage": 93.5, "Overall Occupancy Percentage": 88.0, "LVCVA Room Tax Collections": 118299856.0, "En/Deplaned Air Passenger": 33715129, "Clark County Gaming Revenue": 7210700000, "Proportion": 0.11158895699605911}, {"Year": "2000-01-01T00:00:00", "Months": 12, "Visitor Volume": 35849691, "Convention Attendance": 3853363, "Room Inventory": 124270, "Midweek Occupancy Percentage": 86.6, "Weekend Occupancy Percentage": 94.5, "Overall Occupancy Percentage": 89.1, "LVCVA Room Tax Collections": 130550852.0, "En/Deplaned Air Passenger": 36865866, "Clark County Gaming Revenue": 7671252000, "Proportion": 0.10748664472449707}, {"Year": "2001-01-01T00:00:00", "Months": 12, "Visitor Volume": 35017317, "Convention Attendance": 5014240, "Room Inventory": 126610, "Midweek Occupancy Percentage": 81.6, "Weekend Occupancy Percentage": 91.7, "Overall Occupancy Percentage": 84.7, "LVCVA Room Tax Collections": 129053244.0, "En/Deplaned Air Passenger": 35179960, "Clark County Gaming Revenue": 7636547000, "Proportion": 0.14319315211956415}, {"Year": "2002-01-01T00:00:00", "Months": 12, "Visitor Volume": 35071504, "Convention Attendance": 5105450, "Room Inventory": 126787, "Midweek Occupancy Percentage": 80.9, "Weekend Occupancy Percentage": 91.2, "Overall Occupancy Percentage": 84.0, "LVCVA Room Tax Collections": 127102165.0, "En/Deplaned Air Passenger": 35009011, "Clark County Gaming Revenue": 7630562000, "Proportion": 0.145572599338768}, {"Year": "2003-01-01T00:00:00", "Months": 12, "Visitor Volume": 35540126, "Convention Attendance": 5657796, "Room Inventory": 130482, "Midweek Occupancy Percentage": 81.6, "Weekend Occupancy Percentage": 92.8, "Overall Occupancy Percentage": 85.0, "LVCVA Room Tax Collections": 138941106.0, "En/Deplaned Air Passenger": 36265932, "Clark County Gaming Revenue": 7830856000, "Proportion": 0.15919459598989605}, {"Year": "2004-01-01T00:00:00", "Months": 12, "Visitor Volume": 37388781, "Convention Attendance": 5724864, "Room Inventory": 131503, "Midweek Occupancy Percentage": 85.8, "Weekend Occupancy Percentage": 95.0, "Overall Occupancy Percentage": 88.6, "LVCVA Room Tax Collections": 164821755.0, "En/Deplaned Air Passenger": 41441531, "Clark County Gaming Revenue": 8711426000, "Proportion": 0.15311716100078257}, {"Year": "2005-01-01T00:00:00", "Months": 12, "Visitor Volume": 38566717, "Convention Attendance": 6166194, "Room Inventory": 133186, "Midweek Occupancy Percentage": 86.6, "Weekend Occupancy Percentage": 95.0, "Overall Occupancy Percentage": 89.2, "LVCVA Room Tax Collections": 193136789.0, "En/Deplaned Air Passenger": 44267370, "Clark County Gaming Revenue": 9717322000, "Proportion": 0.15988381899346008}, {"Year": "2006-01-01T00:00:00", "Months": 12, "Visitor Volume": 38914889, "Convention Attendance": 6307961, "Room Inventory": 132605, "Midweek Occupancy Percentage": 87.4, "Weekend Occupancy Percentage": 94.6, "Overall Occupancy Percentage": 89.7, "LVCVA Room Tax Collections": 207289931.0, "En/Deplaned Air Passenger": 46304376, "Clark County Gaming Revenue": 10630387000, "Proportion": 0.16209633798518608}, {"Year": "2007-01-01T00:00:00", "Months": 12, "Visitor Volume": 39196761, "Convention Attendance": 6209253, "Room Inventory": 132947, "Midweek Occupancy Percentage": 88.7, "Weekend Occupancy Percentage": 94.3, "Overall Occupancy Percentage": 90.4, "LVCVA Room Tax Collections": 219713911.0, "En/Deplaned Air Passenger": 47729527, "Clark County Gaming Revenue": 10868464000, "Proportion": 0.1584124004531905}, {"Year": "2008-01-01T00:00:00", "Months": 12, "Visitor Volume": 37481552, "Convention Attendance": 5899725, "Room Inventory": 140529, "Midweek Occupancy Percentage": 84.3, "Weekend Occupancy Percentage": 89.8, "Overall Occupancy Percentage": 86.0, "LVCVA Room Tax Collections": 207117817.0, "En/Deplaned Air Passenger": 44074642, "Clark County Gaming Revenue": 9796749000, "Proportion": 0.1574034340947248}, {"Year": "2009-01-01T00:00:00", "Months": 12, "Visitor Volume": 36351469, "Convention Attendance": 4492275, "Room Inventory": 148941, "Midweek Occupancy Percentage": 78.2, "Weekend Occupancy Percentage": 88.8, "Overall Occupancy Percentage": 81.5, "LVCVA Room Tax Collections": 153150310.0, "En/Deplaned Air Passenger": 40469012, "Clark County Gaming Revenue": 8838261000, "Proportion": 0.12357891231300722}, {"Year": "2010-01-01T00:00:00", "Months": 12, "Visitor Volume": 37335436, "Convention Attendance": 4473134, "Room Inventory": 148935, "Midweek Occupancy Percentage": 76.8, "Weekend Occupancy Percentage": 88.4, "Overall Occupancy Percentage": 80.4, "LVCVA Room Tax Collections": 163809985.0, "En/Deplaned Air Passenger": 39757359, "Clark County Gaming Revenue": 8908574000, "Proportion": 0.11980934145244748}, {"Year": "2011-01-01T00:00:00", "Months": 12, "Visitor Volume": 38928708, "Convention Attendance": 4865272, "Room Inventory": 150161, "Midweek Occupancy Percentage": 80.7, "Weekend Occupancy Percentage": 90.9, "Overall Occupancy Percentage": 83.8, "LVCVA Room Tax Collections": 194329584.0, "En/Deplaned Air Passenger": 41481204, "Clark County Gaming Revenue": 9222677000, "Proportion": 0.12497902576165641}, {"Year": "2012-01-01T00:00:00", "Months": 12, "Visitor Volume": 39727022, "Convention Attendance": 4944014, "Room Inventory": 150481, "Midweek Occupancy Percentage": 81.6, "Weekend Occupancy Percentage": 90.8, "Overall Occupancy Percentage": 84.4, "LVCVA Room Tax Collections": 200384250.0, "En/Deplaned Air Passenger": 41667596, "Clark County Gaming Revenue": 9399845000, "Proportion": 0.12444965041678684}, {"Year": "2013-01-01T00:00:00", "Months": 12, "Visitor Volume": 39668221, "Convention Attendance": 5107416, "Room Inventory": 150593, "Midweek Occupancy Percentage": 81.4, "Weekend Occupancy Percentage": 91.1, "Overall Occupancy Percentage": 84.3, "LVCVA Room Tax Collections": 210138974.0, "En/Deplaned Air Passenger": 41857059, "Clark County Gaming Revenue": 9674404000, "Proportion": 0.12875334137116964}, {"Year": "2014-01-01T00:00:00", "Months": 12, "Visitor Volume": 41126512, "Convention Attendance": 5194580, "Room Inventory": 150544, "Midweek Occupancy Percentage": 83.9, "Weekend Occupancy Percentage": 93.3, "Overall Occupancy Percentage": 86.8, "LVCVA Room Tax Collections": 232443537.0, "En/Deplaned Air Passenger": 42885350, "Clark County Gaming Revenue": 9553864000, "Proportion": 0.12630733187390167}, {"Year": "2015-01-01T00:00:00", "Months": 12, "Visitor Volume": 42312216, "Convention Attendance": 5891151, "Room Inventory": 149213, "Midweek Occupancy Percentage": 85.2, "Weekend Occupancy Percentage": 93.7, "Overall Occupancy Percentage": 87.7, "LVCVA Room Tax Collections": 254438208.0, "En/Deplaned Air Passenger": 45389074, "Clark County Gaming Revenue": 9617671000, "Proportion": 0.13923050024134873}, {"Year": "2016-01-01T00:00:00", "Months": 12, "Visitor Volume": 42936100, "Convention Attendance": 6310600, "Room Inventory": 149339, "Midweek Occupancy Percentage": 86.5, "Weekend Occupancy Percentage": 95.0, "Overall Occupancy Percentage": 89.1, "LVCVA Room Tax Collections": 273079478.0, "En/Deplaned Air Passenger": 47435027, "Clark County Gaming Revenue": 9713930000, "Proportion": 0.1469765535295474}, {"Year": "2017-01-01T00:00:00", "Months": 12, "Visitor Volume": 42214200, "Convention Attendance": 6646200, "Room Inventory": 148896, "Midweek Occupancy Percentage": 86.2, "Weekend Occupancy Percentage": 94.3, "Overall Occupancy Percentage": 88.7, "LVCVA Room Tax Collections": 282497037.0, "En/Deplaned Air Passenger": 48500244, "Clark County Gaming Revenue": 9978503000, "Proportion": 0.1574399135835809}, {"Year": "2018-01-01T00:00:00", "Months": 12, "Visitor Volume": 42116800, "Convention Attendance": 6501800, "Room Inventory": 149158, "Midweek Occupancy Percentage": 85.5, "Weekend Occupancy Percentage": 94.5, "Overall Occupancy Percentage": 88.2, "LVCVA Room Tax Collections": 282596040.0, "En/Deplaned Air Passenger": 49716584, "Clark County Gaming Revenue": 10249964000, "Proportion": 0.15437545112639137}, {"Year": "2019-01-01T00:00:00", "Months": 10, "Visitor Volume": 31880200, "Convention Attendance": 5164500, "Room Inventory": 149050, "Midweek Occupancy Percentage": 86.7, "Weekend Occupancy Percentage": 95.1, "Overall Occupancy Percentage": 89.2, "LVCVA Room Tax Collections": null, "En/Deplaned Air Passenger": 38500861, "Clark County Gaming Revenue": 7753090000, "Proportion": 0.16199710164929956}]}};
      var embedOpt = {"mode": "vega-lite"};

      function showError(el, error){
          el.innerHTML = ('<div class="error" style="color:red;">'
                          + '<p>JavaScript Error: ' + error.message + '</p>'
                          + "<p>This usually means there's a typo in your chart specification. "
                          + "See the javascript console for the full traceback.</p>"
                          + '</div>');
          throw error;
      }
      const el = document.getElementById('vis');
      vegaEmbed("#vis", spec, embedOpt)
        .catch(error => showError(el, error));
    })(vegaEmbed);

</script>

# Load packages and import data


```python
import pandas as pd
import altair as alt
```


```python
df = pd.read_csv('https://query.data.world/s/n3pj6omagl3flwxbzs6mblkjroi45y', sep='\t', 
                 thousands=',', encoding='utf_16_le')
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Months</th>
      <th>Visitor Volume</th>
      <th>Convention Attendance</th>
      <th>Room Inventory</th>
      <th>Midweek Occupancy Percentage</th>
      <th>Weekend Occupancy Percentage</th>
      <th>Overall Occupancy Percentage</th>
      <th>LVCVA Room Tax Collections</th>
      <th>En/Deplaned Air Passenger</th>
      <th>Clark County Gaming Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1970</td>
      <td>12</td>
      <td>6787650</td>
      <td>269129</td>
      <td>25430</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>68.00%</td>
      <td>3751265.0</td>
      <td>4086973</td>
      <td>369,286,977</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1971</td>
      <td>12</td>
      <td>7361783</td>
      <td>312347</td>
      <td>26044</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>78.30%</td>
      <td>4241630.0</td>
      <td>4102285</td>
      <td>399,410,972</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1972</td>
      <td>12</td>
      <td>7954748</td>
      <td>290794</td>
      <td>26619</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>81.20%</td>
      <td>4770716.0</td>
      <td>4608764</td>
      <td>476,126,720</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1973</td>
      <td>12</td>
      <td>8474727</td>
      <td>357248</td>
      <td>29198</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>84.40%</td>
      <td>5556312.0</td>
      <td>5397017</td>
      <td>588,221,779</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1974</td>
      <td>12</td>
      <td>8664751</td>
      <td>311908</td>
      <td>32826</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>78.70%</td>
      <td>6559315.0</td>
      <td>5944433</td>
      <td>684,714,502</td>
    </tr>
  </tbody>
</table>
</div>



So, every year has 12 months?


```python
df.query('Months != 12')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Months</th>
      <th>Visitor Volume</th>
      <th>Convention Attendance</th>
      <th>Room Inventory</th>
      <th>Midweek Occupancy Percentage</th>
      <th>Weekend Occupancy Percentage</th>
      <th>Overall Occupancy Percentage</th>
      <th>LVCVA Room Tax Collections</th>
      <th>En/Deplaned Air Passenger</th>
      <th>Clark County Gaming Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>49</th>
      <td>2019</td>
      <td>10</td>
      <td>31880200</td>
      <td>5164500</td>
      <td>149050</td>
      <td>86.7%</td>
      <td>95.1%</td>
      <td>89.2%</td>
      <td>NaN</td>
      <td>38500861</td>
      <td>$7,753,090,000</td>
    </tr>
  </tbody>
</table>
</div>



Yes, except for the current one, 2019. 

And a quick `describe`.


```python
df.describe(include='all')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Months</th>
      <th>Visitor Volume</th>
      <th>Convention Attendance</th>
      <th>Room Inventory</th>
      <th>Midweek Occupancy Percentage</th>
      <th>Weekend Occupancy Percentage</th>
      <th>Overall Occupancy Percentage</th>
      <th>LVCVA Room Tax Collections</th>
      <th>En/Deplaned Air Passenger</th>
      <th>Clark County Gaming Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>50.00000</td>
      <td>50.000000</td>
      <td>5.000000e+01</td>
      <td>5.000000e+01</td>
      <td>50.000000</td>
      <td>37</td>
      <td>37</td>
      <td>50</td>
      <td>4.900000e+01</td>
      <td>5.000000e+01</td>
      <td>50</td>
    </tr>
    <tr>
      <th>unique</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>27</td>
      <td>27</td>
      <td>44</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>50</td>
    </tr>
    <tr>
      <th>top</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>81.60%</td>
      <td>93.50%</td>
      <td>89.10%</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>476,126,720</td>
    </tr>
    <tr>
      <th>freq</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4</td>
      <td>4</td>
      <td>2</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1994.50000</td>
      <td>11.960000</td>
      <td>2.539469e+07</td>
      <td>3.051318e+06</td>
      <td>92756.660000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.983591e+07</td>
      <td>2.589947e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>std</th>
      <td>14.57738</td>
      <td>0.282843</td>
      <td>1.256754e+07</td>
      <td>2.224790e+06</td>
      <td>45366.843933</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>8.887047e+07</td>
      <td>1.544387e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1970.00000</td>
      <td>10.000000</td>
      <td>6.787650e+06</td>
      <td>2.691290e+05</td>
      <td>25430.000000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>3.751265e+06</td>
      <td>4.086973e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1982.25000</td>
      <td>12.000000</td>
      <td>1.204321e+07</td>
      <td>8.432370e+05</td>
      <td>50834.750000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.907066e+07</td>
      <td>1.030479e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1994.50000</td>
      <td>12.000000</td>
      <td>2.860824e+07</td>
      <td>2.804525e+06</td>
      <td>89303.000000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.687679e+07</td>
      <td>2.743886e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2006.75000</td>
      <td>12.000000</td>
      <td>3.737544e+07</td>
      <td>5.106924e+06</td>
      <td>133126.250000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.648218e+08</td>
      <td>4.119840e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2019.00000</td>
      <td>12.000000</td>
      <td>4.293610e+07</td>
      <td>6.646200e+06</td>
      <td>150593.000000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.825960e+08</td>
      <td>4.971658e+07</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



Some numeric values are not in the right type. So I'll take a look and transform them.


```python
df['Clark County Gaming Revenue']
```




    0        369,286,977
    1        399,410,972
    2        476,126,720
    3        588,221,779
    4        684,714,502
    5        770,336,695
    6        845,975,652
    7      1,015,463,342
    8      1,236,235,456
    9      1,423,620,102
    10     1,617,194,799
    11     1,676,148,606
    12     1,751,421,394
    13     1,887,451,717
    14     2,008,155,460
    15     2,256,762,736
    16     2,431,237,168
    17     2,789,336,000
    18     3,136,901,000
    19     3,430,851,000
    20     4,104,001,000
    21     4,152,407,000
    22     4,381,710,000
    23     4,727,424,000
    24     5,430,651,000
    25     5,717,567,000
    26     5,783,735,000
    27     6,152,415,000
    28     6,346,958,000
    29     7,210,700,000
    30     7,671,252,000
    31     7,636,547,000
    32     7,630,562,000
    33     7,830,856,000
    34     8,711,426,000
    35     9,717,322,000
    36    10,630,387,000
    37    10,868,464,000
    38     9,796,749,000
    39     8,838,261,000
    40     8,908,574,000
    41     9,222,677,000
    42     9,399,845,000
    43     9,674,404,000
    44     9,553,864,000
    45     9,617,671,000
    46     9,713,930,000
    47     9,978,503,000
    48    10,249,964,000
    49    $7,753,090,000
    Name: Clark County Gaming Revenue, dtype: object



One value has a `$` that is impeding the transformation to numeric. I'll fix this and alo some other changes to make the data looks better in the plot and creating a new column to see proportion as 


```python
df_clean = df.copy()
df_clean['Clark County Gaming Revenue'] = pd.to_numeric(df_clean['Clark County Gaming Revenue'].str.replace('[,$]',''),
                                                       downcast='integer')
df_clean['Midweek Occupancy Percentage'] = pd.to_numeric(df_clean['Midweek Occupancy Percentage'].str.replace('%',''))
df_clean['Weekend Occupancy Percentage'] = pd.to_numeric(df_clean['Weekend Occupancy Percentage'].str.replace('%',''))
df_clean['Overall Occupancy Percentage'] = pd.to_numeric(df_clean['Overall Occupancy Percentage'].str.replace('%',''))

#Create new column
df_clean['Proportion'] = df_clean['Convention Attendance']/df_clean['Visitor Volume']
df_clean['Year'] = pd.to_datetime(df_clean['Year'], format='%Y')

df_clean.dtypes
```




    Year                            datetime64[ns]
    Months                                   int64
    Visitor Volume                           int64
    Convention Attendance                    int64
    Room Inventory                           int64
    Midweek Occupancy Percentage           float64
    Weekend Occupancy Percentage           float64
    Overall Occupancy Percentage           float64
    LVCVA Room Tax Collections             float64
    En/Deplaned Air Passenger                int64
    Clark County Gaming Revenue              int64
    Proportion                             float64
    dtype: object



So the values are now in the correct format. Let's see if there are `NAs` and make the visualization.


```python
df_clean.isnull().sum()
```




    Year                             0
    Months                           0
    Visitor Volume                   0
    Convention Attendance            0
    Room Inventory                   0
    Midweek Occupancy Percentage    13
    Weekend Occupancy Percentage    13
    Overall Occupancy Percentage     0
    LVCVA Room Tax Collections       1
    En/Deplaned Air Passenger        0
    Clark County Gaming Revenue      0
    Proportion                       0
    dtype: int64



Three variables have NA values but I'll redo the original plot with two plots.


```python
brush = alt.selection_interval(encodings=['x'],empty='all')

base_line_bar = alt.Chart(df_clean).encode(
    x=alt.X('Year', title=None),
    color=alt.condition(brush, alt.ColorValue('darkblue'), alt.ColorValue('gray')),
    tooltip=alt.Tooltip('year(Year):N')
).add_selection(
    brush
)

#Convention line/scatter
chart_convention = base_line_bar.mark_line(point=True, size=3).encode( 
    y=alt.Y('Convention Attendance', title='Number of attendees',
           axis=alt.Axis(format='~s'))
).properties(
    title='Convention Attendance',
    width=400,
    height=300*14/45
) 

#Visitor line/scatter
chart_visitors = base_line_bar.mark_line(point=True, size=3).encode( 
    y=alt.Y('Visitor Volume', title='Number of visitors',
           axis=alt.Axis(format='~s'))
).properties(
    title='Visitor Volume',
    width=400,
    height=300
)

#Conventionas proportion of total visitors
chart_proportion = base_line_bar.mark_bar().encode(
    y=alt.Y('Proportion', title=None,
           axis=alt.Axis(format='%'))
).properties(
    title='Share of Visitors from Conventions',
    width=400,
    height=300*14/45
) 

#Gaming Spending
chart_spending = base_line_bar.mark_line(
    point=True, size=3
).encode(
    y=alt.Y('Clark County Gaming Revenue', title='Dollars',
           axis=alt.Axis(format='~s')),
    color=alt.condition(brush, alt.ColorValue('darkgreen'), alt.ColorValue('gray'))
).properties(
    title='Clark County Gaming Revenue',
    width=400,
    height=300
)

final_chart = (
    (
        chart_convention & chart_visitors
    ) | (
        chart_proportion & chart_spending
    )
).properties(
    title = 'Las Vegas Visitors Info 1979 - 2019(October)'
).configure(
    background='Snow'
).configure_axis(
    grid=False,
    domain=False,
    titleFontSize=13,
    titleFontWeight='normal',
    titleColor='dimgray',
    labelColor='dimgray'
).configure_view(
    strokeWidth=0
).configure_title(
    fontSize=15,
    anchor='middle',
    color='darkslategray'
)

final_chart.save("../docs/assets/images/2019_11_04_MM.png")
final_chart.save('2019_11_04_MM.html')
final_chart
```




![Static](https://raw.githubusercontent.com/jorgel-mendes/Behold-the-Vision/master/docs/assets/images/2019_11_04_MM.png)
