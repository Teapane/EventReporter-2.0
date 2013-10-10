class Attendee

  attr_accessor :first_name,
             :last_name, 
             :email, 
             :home_phone,
             :street, 
             :city, 
             :state,
             :zipcode

  def initialize(data)
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @email      = data[:email]
    @home_phone = data[:home_phone]
    @street     = data[:street]
    @city       = data[:city]
    @state      = data[:state]
    @zipcode    = data[:zipcode]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phonenum(phonenum)
    phone = phonenum.gsub(/\D/, "")
    case 
      when phone.length == 11 && phone[0] == "1" then phone[1..-1]
      when phone.length == 10 then phone
      else "0000000000"
    end
  end
end
