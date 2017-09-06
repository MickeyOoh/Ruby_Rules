# SMTP -Simple Mail Transfer Protocol
require 'net/smtp'
require 'tlsmail'

SMTPSERVER = 'smtp.mail.yahoo.co.jp'
DOMAIN   = 'yahoo.co.jp'
PORT	  = 465
USERNAME = 'solm_sys'
PASSWORD = 'anri0623'

def send_email from, to, mailtext
  begin
	  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start(SMTPSERVER, PORT, DOMAIN,
					 USERNAME, PASSWORD, :login) do |smtp|
			smtp.send_message mailtext, from, to
	  end
	rescue => e
	  raise "Exception occured: #{e} "
		exit -1
	end
end
       

msg = <<MSG_END
From: solm_sys<solm_sys@yahoo.co.jp>
To: <mikio_westvil@yahoo.ca>
Subject: email test

This is a test email message.
MSG_END
send_email('solm_sys@yahoo.co.jp', 'mikio_westvil@yahoo.ca', msg)
#smtp = Net::SMTP.new(smtpserver, port)
#smtp.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
#smtp.start
#smtp.sendmail message, 'solm_sys@yahoo.co.jp', 'mikio_westvil@yahoo.ca'
#Net::SMTP.start(smtpserver, port, domain, username, password, :login) do |smtp|
#  smtp.send_message message, 'solm_sys@yahoo.co.jp', 'mikio_westvil@yahoo.ca'
#end

