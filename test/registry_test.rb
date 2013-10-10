gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'

class RegistryTest < Minitest::Test

attr_reader :registry

def setup
  @registry = Registry.new
  end


def test_it_finds_attendees_by_first_name_irrespective_of_case
   registry.attendees = [
      Attendee.new(:first_name =>"SaRah"),
      Attendee.new(:first_name =>"sarah")
    ]
    attendees = registry.find_all_by_first_name("Sarah")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "sarah", attendee.first_name.downcase
   end
  end

  def test_it_finds_attendees_by_last_name_irrespective_of_case
   registry.attendees = [
      Attendee.new(:last_name =>"Johns"),
      Attendee.new(:last_name =>"Smith"),
      Attendee.new(:last_name =>"JohNS")

    ]
    attendees = registry.find_all_by_last_name("johns")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "johns", attendee.last_name.downcase
   end
  end

 def test_it_finds_attendees_by_email
   registry.attendees = [
      Attendee.new(:email => "johns@smith.com"),
      Attendee.new(:email => "johns@smith.com"),
      Attendee.new(:email => "you@you.com")

    ]
    attendees = registry.find_all_by_email("johns@smith.com")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "johns@smith.com", attendee.email
   end
  end

 def test_it_finds_attendees_by_state
  registry.attendees = [
    Attendee.new(:state => "CO"),
    Attendee.new(:state => "CO"),
    Attendee.new(:state => "WA")

  ]
  attendees = registry.find_all_by_state("co")
  assert_equal 2, attendees.count
  attendees.each do |attendee|
    assert_equal "co", attendee.state.downcase
   end
  end

 def test_it_finds_attendees_by_city
  registry.attendees = [
    Attendee.new(:city => "denver"),
    Attendee.new(:city => "DenVer"),
    Attendee.new(:city => "Atlanta")

  ]
  attendees = registry.find_all_by_city("denver")
  assert_equal 2, attendees.count
  attendees.each do |attendee|
    assert_equal "denver", attendee.city.downcase
   end
  end

 def test_it_finds_attendees_by_phone_irrespective_of_format
    registry.attendees = [
      Attendee.new(:home_phone => "303-333-3333"),
      Attendee.new(:home_phone => "3033333333"),
      Attendee.new(:home_phone => "303.333.3333"),
      Attendee.new(:home_phone => "(303)333-3333"),
      Attendee.new(:home_phone => "(303) 333.3333"),
      Attendee.new(:home_phone => "519-757-3424")
    ]

    attendees = registry.find_all_by_phone("(303) 333.3333")

    assert_equal 5, attendees.count
    attendees.each do |attendee|
      assert_equal "3033333333", attendee.home_phone.gsub(/\D/, "")
    end
  end

  def test_it_finds_attendees_by_street_address_irrespective_of_case
    registry.attendees = [
      Attendee.new(:street => "125 blue spruce St."),
      Attendee.new(:street => "125 BLUe SPruCe ST."),
      Attendee.new(:street => "1860 South Marion.")
    ]

    attendees = registry.find_all_by_street("125 blue spruce st.")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "125 blue spruce st.", attendee.street.downcase
    end
  end

  def test_it_finds_attendees_by_state_irrespective_of_case
    registry.attendees = [
      Attendee.new(:state => "co"),
      Attendee.new(:state => "CO"),
      Attendee.new(:state => "cO"),
      Attendee.new(:state => "WA"),
    ]

    attendees = registry.find_all_by_state("Co")

    assert_equal 3, attendees.count
    attendees.each do |attendee|
      assert_equal "co", attendee.state.downcase
    end
  end

  def test_it_finds_attendees_by_zipcode
    registry.attendees = [
      Attendee.new(:zipcode => "80439"),
      Attendee.new(:zipcode => "80439"),
      Attendee.new(:zipcode => "80210")
    ]

    attendees = registry.find_all_by_zipcode("80439")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "80439", attendee.zipcode
    end
  end
end
