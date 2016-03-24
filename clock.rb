# Author: Colin Hart (@ColinTheRobot); adapted by Jason Seminara (@jasonseminara). 
# Description: A pseudo-clock that ticks off seconds forever.
# Date: 2016-03-24

# Build a clock using only strings and loops.
# Only use the Time class to initially set the clock to the current time.
# This should print the current time out to the screen once every second, 
# and print an alarm at the requested time
# Time fragments must be zero-padded properly.

# BONUS: figure out how to actually make an audible buzz or ding for the alarm. 

class Clock

  def initialize
    # preset to the current time
    @current_time = "%02d:%02d:%02d" % Time.now.to_a[0..2].reverse
    @alarms=[]
  end


  def set_time(h,m)
    @current_time = "#{h}:#{m}:00"
  end


  def set_alarm(h,m)
    if h < 10
      h = '0'+h.to_s
    end
    if m < 10
      m = '0'+h.to_s
    end
    @alarms.push("#{h}:#{m}:00")
  end

  def check_for_alarm
    if @alarms.include? @current_time 
      @alarms.delete_at(@alarms.index(@current_time))
      puts "BRRINNNGGG"
    end
  end

  def start_clock
    loop do
      @current_time = "%02d:%02d:%02d" % Time.now.to_a[0..2].reverse
      puts @current_time
      check_for_alarm
      sleep 1
    end
  end

  class Alarm
    def initialize(hr, min, snooze_length=10)
      # init your alarm here
    end
  end
end

c = Clock.new
c.set_alarm(13, 59)
c.start_clock
# c.set_time(9, 24)
# c.set_alarm(9,25)
# c.set_alarm(9,26)
