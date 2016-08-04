require 'date'
require 'terminal-table'

def init_subjects

  subjects = []

  subjects.push( { "Code" => "MT30001" , "Subject" => "Materials Engineering" , "Place" => "NR421" , "Slot" => { "Monday" => "08-10" , "Tuesday" => "12-01" }} )
  subjects.push( { "Code" => "ME30005" , "Subject" => "Heat Transfer" , "Place" => "NC242" , "Slot" => { "Monday" => "10-11" , "Wednesday" => "08-10" , "Thursday" => "10-11" }} )
  subjects.push( { "Code" => "HS30068" , "Subject" => "Symbolic Logic" , "Place" => "NR123" , "Slot" => { "Monday" => "11-12" , "Tuesday" => "08-10" }} )
  subjects.push( { "Code" => "ME31007" , "Subject" => "CFW" , "Place" => "NR321" , "Slot" => { "Monday" => "12-01" , "Tuesday" => "10-12" , "Thursday" => "08-09" }} )
  subjects.push( { "Code" => "MA21007" , "Subject" => "Design & Analysis of Algo" , "Place" => "NR322" , "Slot" => { "Monday" => "03-05" , "Tuesday" => "02-04" }} )
  subjects.push( { "Code" => "ME31013" , "Subject" => "Mech of solids" , "Place" => "NR322" , "Slot" => { "Wednesday" => "12-01" , "Thursday" => "11-12" , "Friday" => "09-11" }} )
  subjects.push( { "Code" => "ME39013" , "Subject" => "Mech of solids - Lab" , "Place" => "Dept" , "Slot" => { "Thursday" => "02-05" }} )
  subjects.push( { "Code" => "ME39007" , "Subject" => "CFW Lab" , "Place" => "Dept" , "Slot" => { "Friday" => "02-05" }} )

  return subjects

end

def print_timetable subjects , day

  found , match , to_print =  0 , [] , [] 
  subjects.each do |subject|
    if subject["Slot"].keys.include? day
      if found == 0
        puts ""
      end
      val = subject["Slot"][day].split("-")[0].to_i
      if val <= 6
        subject["Slot"][day] = subject["Slot"][day].gsub("0"+val.to_s,(val+12).to_s)
      end
      match.push(subject)
      found = found + 1
    end
  end

  match = match.sort_by { |row| row["Slot"][day].split("-")[0].to_i }
  match.each do |subject|
    time = subject["Slot"][day].split("-")[0].to_i
    if time > 12
      real_time = "0"+subject["Slot"][day].gsub(time.to_s,(time-12).to_s) 
      to_print.push([real_time,subject["Subject"]+" (" + subject["Code"]+" ) ",subject["Place"]])
      #puts "#{real_time} - #{subject["Subject"]} (#{subject["Code"]}) - #{subject["Place"]} "
    else
      to_print.push([subject["Slot"][day],subject["Subject"]+" ("+subject["Code"]+" ) ",subject["Place"]])
      #puts "#{subject["Slot"][day]} - #{subject["Subject"]} (#{subject["Code"]}) - #{subject["Place"]} "
    end
  end

  #puts "\nFound #{found} classes for #{day}"
  #puts ""

  table = Terminal::Table.new :title => "#{day.upcase} - TIMETABLE - Found #{found} classes", :headings => ['TIMING', 'COURSE', 'PLACE'], :rows => to_print, :style => { :alignment => :center, :border_x => "=", :border_i => "="}
  puts table
  puts ""

end

def get_day args 

  puts ""
  if args.length == 0
    print "Enter day (Default day is today = #{Date.today.strftime("%A")}) : "
    day = gets.chomp.to_s 
  else
    if args == "All"
      day = "Monday,Tuesday,Wednesday,Thursday,Friday"  
    else
      if args == "Today"
        day = Date.today.strftime("%A")
      elsif args == "Yesterday"
        day = (Date.today-1).strftime("%A") 
      elsif args == "Tomorrow"
        day = (Date.today+1).strftime("%A")
      else
        day = args
      end  
    end
  end
  day = day.length == 0 ? Date.today.strftime("%A") : day
  return day

end

if ARGV.length == 1 
  day = get_day(ARGV[0])
  ARGV.clear
else
  day = get_day("")  
end

subjects = init_subjects()
if day.include? ","
  days = day.split(",")
  days.each do |each_day|
    print_timetable(subjects,each_day)
  end
else
  print_timetable(subjects,day)
end
