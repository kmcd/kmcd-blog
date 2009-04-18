# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  EMAIL = "keith@dancingtext.com"
  
  def email_address
    link_to obfusticated_email, "mailto:#{EMAIL}"
  end

  private
  
  def obfusticated_email
    ascii = ""
    EMAIL.each_byte {|b| ascii += "&##{b.to_s};" }
    ascii
  end
end
