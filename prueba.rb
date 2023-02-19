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

      today =2023-02-22
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


      puts wdays