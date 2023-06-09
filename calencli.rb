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
        "guests" => ["Gabriel", "Gabriela", "Fernando"],
        "calendar" => "web-dev" }
      ]
      
    def w_sort (events)
      today = Date.today
      days_until_monday = today.wday == 0 ? 6 : today.wday - 1
      monday = today - days_until_monday

      cwdays = []
      for i in monday..monday+6
        cwdays.push(i)
      end
      
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
      date_validation = []
      for i in 0..(current_w_s.length-1)
        date_comp = (DateTime.parse(current_w_s[i]["start_date"])).to_date
        if date_validation.include?(date_comp) == false
          date_validation.push(date_comp)
        end
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

      flags = []
      for i in 0..(cwdays.length-1)
        if date_validation.include?(cwdays[i]) == true
        flags.push(1)
        else
        flags.push(0)
        end
      end
        
      for i in 0..(flags.length-1)
        phantom_date = cwdays[i].strftime("%Y-%m-%dT%H:%M:%S%:z")
        hash = {"id" => "",
          "start_date" => phantom_date, 
          "title" => "No events",
          "end_date" => "",
          "notes" => "",
          "guests" => [],
          "calendar" => "" }
        if flags[i] == 0
          wdays[i].push(hash)
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

      def create(events, id)        
        new_event = Hash.new
        new_event["id"] = id.next
        print "Date: "
        date = gets.chomp
        while date.length != 10
          puts "Type a valid date: YYYY-MM-DD"
          print "Date: "
          date = gets.chomp
        end
        fecha = Date.parse(date)
        fecha_format = DateTime.new(fecha.year, fecha.month, fecha.day, 0, 0, 0, "-05:00")
        start_date = fecha_format.iso8601
        new_event["start_date"] = start_date
        
        print "Title: "
        n_title = gets.chomp
        while n_title == ""
          puts "Title cannot be blank"
          print "Title: "
          n_title = gets.chomp
        end
        new_event["title"] = n_title
        
        print "Calendar: "
        calendar = gets.chomp
        
        print "start_end: "
        date = gets.chomp
        while date.length != 11 && date != ""
          puts "'HH:MM HH:MM' or leave it empty"
          print "start_end: "
          date = gets.chomp
        end
        if date != ""
          fecha_div = date.split("-")
          
          fecha_st = fecha_div[0]
          fecha_end = fecha_div[1]
          
          time_s = Time.parse(fecha_st)
          datetime = DateTime.new(fecha.year, fecha.month, fecha.day, time_s.hour, time_s.min, 0, Rational(-5, 24))
          new_event["start_date"] = datetime.strftime("%Y-%m-%dT%H:%M:%S%:z")
          
          time_e = Time.parse(fecha_end)
          datetime_end = DateTime.new(fecha.year, fecha.month, fecha.day, time_e.hour, time_e.min, 0, Rational(-5, 24))
          new_event["end_date"] = datetime_end.strftime("%Y-%m-%dT%H:%M:%S%:z")
        else
          new_event["end_date"] = ""
        end
        
        print "notes: "
        u_notes = gets.chomp
        new_event["notes"] = u_notes
        
        print "guests: "
        u_guests = gets.chomp
        guests_arr = u_guests.split(", ")
        new_event["guests"]  = guests_arr
        new_event["calendar"] = calendar
        

        events.push(new_event)
        return events
      end
      
      def show(events)
        print "Event ID: "
        e_id = gets.chomp.to_i
        
        find = nil
        while find.nil?
          for i in 0..(events.length-1)
            if events[i]["id"] == e_id
              find = 1
              break
            end
          end
          if find.nil?
            puts "ID no existe, ingrese ID valido"
            print "ID: "
            e_id = gets.chomp.to_i
          end
        end
        
        
        for i in 0..(events.length-1)
          if events[i]["id"] == e_id
            ind = i
            break
          end
        end      
        
        puts "date: #{(DateTime.parse(events[ind]["start_date"])).to_date}"
        puts "title: #{events[ind]["title"]}"
        puts "calendar: #{events[ind]["calendar"]}"
        if events[ind]["end_date"] != ""
        date_s = DateTime.parse(events[ind]["start_date"])
        date_s_f = date_s.strftime("%H:%M")
        date_e = DateTime.parse(events[ind]["end_date"])
        date_e_f = date_s.strftime("%H:%M")
        puts "start_end: #{date_s_f} #{date_e_f}"
        else
          puts "start_end: "
        end
        puts "notes: #{events[ind]["notes"]}"
        guests_s = events[ind]["guests"].join(", ")
        print "guests: #{guests_s}\n"
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
        
        print "Updated date: "
        date = gets.chomp
        while date.length != 10
          puts "Type a valid date: YYYY-MM-DD"
          print "Date: "
          date = gets.chomp
        end
        fecha = Date.parse(date)
        fecha_format = DateTime.new(fecha.year, fecha.month, fecha.day, 0, 0, 0, "-05:00")
        events[ind]["start_date"] = fecha_format.iso8601
        
        
        print "Updated title: "
        n_title = gets.chomp
        while n_title == ""
          puts "Title cannot be blank"
          print "Title: "
          n_title = gets.chomp
        end
        events[ind]["title"] = n_title
        
        print "Updated start-end: "
        n_start_end = gets.chomp
        while n_start_end.length != 11 && n_start_end != ""
          puts "'HH:MM HH:MM' or leave it empty"
          print "start_end: "
          n_start_end = gets.chomp
        end
        if n_start_end != ""
        fecha_div = n_start_end.split("-")
        
          fecha_st = fecha_div[0]
          fecha_end = fecha_div[1]
          
          time_s = Time.parse(fecha_st)
          datetime = DateTime.new(fecha.year, fecha.month, fecha.day, time_s.hour, time_s.min, 0, Rational(-5, 24))
          events[ind]["start_date"] = datetime.strftime("%Y-%m-%dT%H:%M:%S%:z")
          
          time_e = Time.parse(fecha_end)
          datetime_end = DateTime.new(fecha.year, fecha.month, fecha.day, time_e.hour, time_e.min, 0, Rational(-5, 24))
          events[ind]["end_date"] = datetime_end.strftime("%Y-%m-%dT%H:%M:%S%:z")
        else
          events[ind]["end_date"] = ""
        end
          
          print "Updated notes: "
          u_notes = gets.chomp
          events[ind]["notes"] = u_notes
          
          print "Updated guests: "
          u_guests = gets.chomp
          guests_arr = u_guests.split(", ")
          events[ind]["guests"]  = guests_arr
          
          return events
        end
        
        def delete(events)
          print "Event ID: "
          e_id = gets.chomp.to_i
        
          for i in 0..(events.length-1)
            if events[i]["id"] == e_id
              ind = i
              break
            end
          end
          
          events.delete(events[ind])
          puts "Event ID #{e_id} has been deleted"
          return events
        end
        
        def calendar (current_w)
          puts "-----------------------------Welcome to CalenCLI------------------------------"
          puts ""
          date_formatted = nil
          today = Date.today
          days_until_monday = today.wday == 0 ? 6 : today.wday - 1
          monday = today - days_until_monday
          comparacion = [monday]
          current_w.each_index do |i|
            start_date_s = DateTime.parse(current_w[i]["start_date"]).to_date
            comparacion.push(start_date_s)
            if comparacion[-2] < start_date_s
            puts ""
            end
            start_date_f = start_date_s.strftime("%a %b %d")
            if start_date_f == (date_formatted)
              print "            "
            else
              date = DateTime.parse(current_w[i]["start_date"]).to_date
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
          print "#{current_w[i]["title"]} " 
            if current_w[i]["id"] == ""
              puts "#{current_w[i]["id"]}"
            else       
              puts "(#{current_w[i]["id"]})"
            end
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
      current_w = w_sort(events)
      calendar(current_w)
    when "create"
      events = create(events,id)
      print_options
    when "show"
      show (events)
      print_options
    when "update"
      events = update(events)
      print_options
    when "delete"
      events = delete(events)
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



