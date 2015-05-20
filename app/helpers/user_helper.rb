module UserHelper

  def cpf_formatter(cpf)
    "%s.%s.%s-%s" % [cpf[0,3], cpf[3,3], cpf[6,3], cpf[9,2]]
  end
  def date_formatter(date)
    date.strftime "%d/%m/%Y"
  end
end
