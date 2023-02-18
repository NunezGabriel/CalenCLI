require "date"
require "time"

# DATA
id = 0
events = [
  { "id" => (id = id.next),
    "start_date" => "2023-02-13T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },

  { "id" => (id = id.next),
    "start_date" => "2023-02-13T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-13T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T12:00:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2023-02-14T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Mili"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-15T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2023-02-16T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => ["Paulo", "Andre", "Diego"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T00:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-17T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2023-02-18T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2023-02-18T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
    { "id" => (id = id.next),
      "start_date" => "2023-02-23T00:00:00-05:00",
      "title" => "Extended Project",
      "end_date" => "",
      "notes" => "",
      "guests" => [],
      "calendar" => "web-dev" },
      { "id" => (id = id.next),
        "start_date" => "2023-02-24T09:00:00-05:00",
        "title" => "Extended Project",
        "end_date" => "",
        "notes" => "",
        "guests" => [],
        "calendar" => "web-dev" },
        {"id" => (id = id.next),
        "start_date" => "2023-02-15T09:00:00-05:00",
        "title" => "Extended Project",
        "end_date" => "",
        "notes" => "",
        "guests" => [],
        "calendar" => "web-dev" }
      ]
      
      def w_sort (events)
      today = Date.today
      days_until_monday = today.wday == 0 ? 6 : today.wday - 1
      monday = today - days_until_monday
      
      current_w_s = []
      for i in 0..(events.length-1)
        date_comp = (DateTime.parse(events[i]["start_date"])).to_date
        for day in monday..(monday+6)
          if date_comp == day
            current_w_s.push(events[i])
            break
          end
        end
        current_w_s.sort_by! { |event| event["start_date"] }.each
      end
      
      wdays = [[],[],[],[],[],[],[]]
      for i in 0..(current_w_s.length-1)
        date_comp = (DateTime.parse(current_w_s[i]["start_date"])).to_date
        case date_comp
        when monday
          wdays[0].push(current_w_s[i])
        when monday+1
          wdays[1].push(current_w_s[i])
        when monday+2
          wdays[2].push(current_w_s[i])
        when monday+3
          wdays[3].push(current_w_s[i])
        when monday+4
          wdays[4].push(current_w_s[i])
        when monday+5
          wdays[5].push(current_w_s[i]) 
        when monday+6
          wdays[6].push(current_w_s[i])
        end
      end
      current_w = []
      for i in 0..6
        wdays[i].sort_by! { |event| event["end_date"] }.each
        current_w.concat(wdays[i])
      end
      return current_w
    end
      
      def print_options
        puts "-" * 78
        puts "list | create | show | update | delete | next | prev | exit \n\n"
      end
      
    def update(events)
          print "Event ID: "
          e_id = gets.chomp.to_i
          
          for i in 0..(events.length-1)
           if events[i]["id"] == e_id 
                ind = i
                break
            end
          end

          print "updated date: "
          date = gets.chomp
          fecha = Date.parse(date)
          fecha_format = DateTime.new(fecha.year, fecha.month, fecha.day, 0, 0, 0, "-05:00")
          events[ind]["start_date"] = fecha_format.iso8601
        
          print "updated title: "
          n_title = gets.chomp
          events[ind]["title"] = n_title
        
          print "New start-end: "
          n_start_end = gets.chomp
          fecha_div = n_start_end.split("-")
        
          fecha_st = fecha_div[0]
          fecha_end = fecha_div[1]
        
          time_s = Time.parse(fecha_st)
          datetime = DateTime.new(fecha.year, fecha.month, fecha.day, time_s.hour, time_s.min, 0, Rational(-5, 24))
          events[ind]["start_date"] = datetime.strftime("%Y-%m-%dT%H:%M:%S%:z")
        
          time_e = Time.parse(fecha_end)
          datetime_end = DateTime.new(fecha.year, fecha.month, fecha.day, time_e.hour, time_e.min, 0, Rational(-5, 24))
          events[ind]["end_date"] = datetime_end.strftime("%Y-%m-%dT%H:%M:%S%:z")
        
          print "updated notes: "
          u_notes = gets.chomp
          events[ind]["notes"] = u_notes
        
          print "updated guests: "
          u_guests = gets.chomp
          guests_arr = u_guests.split(", ")
          events[ind]["guests"]  = guests_arr

          return events
    end
      
      def calendar (current_w)
        puts "-----------------------------Welcome to CalenCLI------------------------------"
        puts ""
        date_formatted = nil
        current_w.each_index do |i|
          start_date_s = DateTime.parse(current_w[i]["start_date"])
          start_date_f = start_date_s.strftime("%a %b %d")
          if start_date_f == (date_formatted)
            print "            "
          else
            date = DateTime.parse(current_w[i]["start_date"])
            date_formatted = date.strftime("%a %b %d")
            print date_formatted
            print "  "
          end
          date_formatted = start_date_f

          if current_w[i]["end_date"] == ""
            print "             "
          else
            time_s = DateTime.parse(current_w[i]["start_date"])
            time_s_formatted = time_s.strftime("%H:%M")

            time_e = DateTime.parse(current_w[i]["end_date"])
            time_e_formatted = time_e.strftime("%H:%M")

            print "#{time_s_formatted} - #{time_e_formatted}"
          end
          print " "
          puts "#{current_w[i]["title"]} (#{current_w[i]["id"]})"
        end
        print_options
      end

current_w = w_sort(events)
calendar(current_w)

actions = nil

while actions != "exit"
  print "action: "
  actions = gets.chomp

    case actions
    when "list"
      curent_w = w_sort(events)
      calendar(current_w)
    when "create"
      puts "cree esto"
      print_options
    when "show"
      puts "mostre esto"
      print_options
    when "update"
      events = update(events)
      print_options

      # {"id" => (id = id.next), 15
      #   "start_date" => "2023-02-15T09:00:00-05:00",
      #   "title" => "Extended Project",
      #   "end_date" => "",
      #   "notes" => "",
      #   "guests" => [],
      #   "calendar" => "web-dev" }

    when "delete"
      puts "borre esto"
      print_options
    when "next"
      puts "siguiente pagina"
      print_options
    when "prev"
      puts "pagina anterior"
      print_options
    when "exit"
      puts "Thanks to use calenCli!"
    else
      puts "opcion NO valida"
    end
end
