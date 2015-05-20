module UserHelper

  def cpf_formatter(cpf)
    "%s.%s.%s-%s" % [ cpf[0,3], cpf[3,3], cpf[6,3], cpf[9,2] ]
  end

  def date_formatter(date)
    date.strftime "%d/%m/%Y"
  end

  def phone_formatter(phone)
    formatted = nil
    formatted = "%s-%s" % [ phone[0,4], phone[4,4] ] if phone.length == 8 # home phone
    formatted = "%s-%s" % [ phone[0,5], phone[5,4] ] if phone.length == 9 # cellphone
    formatted = "(%s) %s-%s" % [phone[0,2], phone[2,4], phone[6,4] ] if phone.length == 10 # home phone with two digits area code
    formatted = "(%s) %s-%s" % [phone[1,2], phone[3,4], phone[7,4] ] if phone.length == 11 && phone[0] == "0" # home phone with three digits area code - first digit is 0
    formatted = "(%s) %s-%s" % [phone[0,2], phone[2,5], phone[7,4] ] if phone.length == 11 && phone[0] != "0" # cell phone with two digits area code
    formatted = "(%s) %s-%s" % [phone[1,2], phone[3,5], phone[8,4] ] if phone.length == 12  && phone[0] == "0" # cell phone with three digits area code - first digit is 0

    return formatted
  end

end
