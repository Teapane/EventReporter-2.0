gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Printer'
require './lib/Attendee'


class PrinterTest < Minitest::Test


def test_it_formats_a_header
printer = Printer.new
expected_header = "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
assert_equal expected_header, printer.header
end

def test_it_formats_an_attendee
  attendee = Attendee.new( :first_name => "Joe",
                           :last_name  => "Schmo",
                           :email      => "joe@example.com",
                           :zipcode    => "80209",
                           :city       => "Denver",
                           :state      => "CO",
                           :street     => "123 First Street",
                           :home_phone => "303-333-3333")
  printer = Printer.new
  expected = "Schmo Joe joe@example.com 80209 Denver CO 123 First Street 303-333-3333"
  assert_equal expected, printer.format_attendee(attendee)
end

def test_it_formats_attendees
  printer = Printer.new
  attendees = [
   Attendee.new( :first_name => "Joe",
                 :last_name  => "Schmo",
                 :email      => "joe@example.com",
                 :zipcode    => "80209",
                 :city       => "Denver",
                 :state      => "CO",
                 :street     => "123 First Street",
                 :home_phone => "303-333-3333"),
   Attendee.new( :first_name => "Jane",
                 :last_name  => "Schmo",
                 :email      => "jane@example.com",
                 :zipcode    => "80209",
                 :city       => "Denver",
                 :state      => "CO",
                 :street     => "123 First Street",
                 :home_phone => "303-333-3333")
 ]

  expected_1 = "Schmo Joe joe@example.com 80209 Denver CO 123 First Street 303-333-3333"
  expected_2 = "Schmo Jane jane@example.com 80209 Denver CO 123 First Street 303-333-3333"
  expected = [expected_1, expected_2].join("\n") 
  assert_equal expected, printer.format_attendees(attendees)
end

def test_it_has_a_print_attendees_method
  printer = Printer.new
  assert printer.respond_to?(:print_attendees)
end

end
