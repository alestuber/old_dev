module UserHelper
  def cpf_formatter(cpf)
    cpf.gsub!(/(\d{3})(\d{3})(\d{3})(\d{2})/,"\\1.\\2.\\3-\\4")
  end

  def date_formatter(date)
    date.strftime "%d/%m/%Y"
  end

  def phone_formatter(phone)
    return nil if phone.length < 8 || phone.length > 12
    phone.gsub!(/^0+/,'')
    phone.gsub!(/(\d{1,2})(\d{4,5})(\d{4}$)/,"(\\1) \\2-\\3") if phone.length > 9
    phone.gsub!(/(\d{4,5})(\d{4}$)/,"\\1-\\2") if phone.length <= 9
    phone
  end
end
