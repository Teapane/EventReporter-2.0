require './lib/attendee'

class Registry
  attr_accessor :attendees

  def find_all_by_first_name(name)
   attendees.find_all{|a| a.first_name.downcase ==  name.downcase}
  end

  def find_by_first_name(name)
  end

  def find_all_by_last_name(name)
    attendees.find_all{|a| a.last_name.downcase ==  name.downcase}
  end

  def find_all_by_email(email)
    attendees.find_all{|a| a.email == email }  
  end

  def find_all_by_phone(home_phone)
    attendees.find_all{|a|
     a.home_phone.gsub(/\D/, "") == home_phone.gsub(/\D/, "")}
  end

  def find_all_by_street(street)
    attendees.find_all {|a| a.street.downcase == street.downcase}
  end

  def find_all_by_city(city)
    attendees.find_all {|a| a.city.downcase == city.downcase}
  end

  def find_all_by_state(state)
    attendees.find_all {|a| a.state.downcase == state.downcase}
  end

  def find_all_by_zipcode(zipcode)
    attendees.find_all {|a| a.zipcode.downcase == zipcode.downcase}
  end

  def count
    attendees.count
  end


end
