use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L
import math as M

fun week-label(g :: Number) -> String:
  doc: "takes a gain and returns lost/flat/growing based on the gain"
  if g > 9:
    "growing"
  else if g < 0:
    "loss"
  else:
    "flat"
  end
where:
  week-label(9) is "flat"
  week-label(0) is "flat"
  week-label(-1) is "loss"
  week-label(10) is "growing"
end

fun weekly-gains(l :: List<Number>) -> List<Number> block:
  doc: "returns a list of the gain from one element to the next"
  var new-list = [list: ]
  var prev = -1
  for each(n from l) block:
    when prev > -1:
      new-list := new-list + [list: n - prev]
    end
    prev := n
  end
  new-list
where:
  weekly-gains([list: 100, 130, 125, 125]) is [list: 30, -5, 0]
  weekly-gains([list: 50, 62]) is [list: 12]
  weekly-gains([list: 1,2,4,6,10]) is [list: 1,2,2,4]
  weekly-gains([list: 1]) is [list: ]
  weekly-gains([list: ]) is [list: ]
end

fun growing-weeks(l :: List<Number>) -> List<Number> block:
  doc: "only returns the gains that are labelled as growing"
  
  L.filter(lam(g :: Number) -> Boolean: week-label(g) == "growing" end, weekly-gains(l))
where:
  growing-weeks([list: 100, 130, 125, 125]) is [list: 30]
  growing-weeks([list: 100, 105, 90]) is [list: ]
  growing-weeks([list: 100, 130, 125, 140]) is [list: 30, 15]
end


channel = table: week :: String, subscribers :: Number
  row: "Sep 7", 100
  row: "Sep 14", 130
  row: "Sep 21", 125
  row: "Sep 28", 125
  row: "Oct 5", 140
  row: "Oct 12", 140
end

fun channel-report(t :: Table) -> String block:
  doc: "returns 'Subscribers up ∆subs, growing weeks: # of weeks'"
  s = get-column(t, "subscribers")
  l = weekly-gains(s)
  n = num-to-string(M.sum(l))
  g = num-to-string(L.length(growing-weeks(s)))
  if M.sum(l) >= 0:
    "Subscribers up " + n + ", growing weeks: " + g
  else:
    "Subscribers down " + n + ", growing weeks: " + g
  end
where:
  channel-report(channel) is "Subscribers up 40, growing weeks: 2"
end

fun color(n :: Number) -> String:
  if week-label(n) == "growing":
    "green"
  else if week-label(n) == "loss":
    "red"
  else:
    "gray"
  end
end


fun gains-chart(log :: List) -> Image block:
  l = weekly-gains(log)
  var chart = empty-image
  for each(e from l) block:
    chart := beside-align("bottom", chart, rectangle(90, 10 * num-abs(e), "outline", color(e)))
  end
  chart
end


gains-chart([list: 100, 130, 125, 130, 150])