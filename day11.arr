use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter-data.csv", default-options)
end


#get column (from the row, r, I want party)

filter-with(voter-data, lam(r :: Row) -> Boolean: get-column(r, "Party") == "Republican" end)

# changing voters with unspecified affiliataion to "Independent"

fun clean-party-col(p :: String) -> String:
  doc: "changes blank parties to independent"
  if p == "":
    "Independent"
  else:
    p
  end
where:
  clean-party-col("") is "Independent"
  clean-party-col("Democrat") is "Democrat"
end

#now use this funciton to transform column
# ( table name, existing column name, function)
transform-column(voter-data, "Party", clean-party-col)

fun normalize-phone(s :: String) -> String:
  doc: "removes dashes from phone numbers"
  string-replace(
    string-replace(
    string-replace(
    string-replace(
      string-replace(s, "-", "")
    ,"(", "")
    , ")", "")
    , ".", "")
    , " ", "")
end

transform-column(voter-data, "Phone", normalize-phone)


fun normalize-bday(s :: String) -> String:
  doc: "removes dashes from phone numbers"
    string-replace(s, "/", "-")

end
transform-column(voter-data, "DOB", normalize-bday)


fun normalize-lv(s :: String) -> String:
  doc: "removes dashes from phone numbers"
  if string-substring(s,2,3) == "." or string-substring(s,2,3) == "/":
    year = string-substring(6,10)
    month = string-substring(0,2)
    day = string-substring(3,5)
    string-replace(s,string-substring(s,2,3),string-substring(5,


