#!/usr/bin/env ruby

<<-DOC
  Script for Google Mail to completely delete mails from unwanted sources. 
  Adding missing functionality to GMail. Only works for IMAP accounts.

  Date: 19.08.2014

DOC
  



require 'gmail'
require 'json'
print "\n\n\n"
print "Connecting to Google Mail ..."
gmail = Gmail.new(':USERNAME', ':PASSWORD')
print " done.\n"
print "Check for mails from unwanted source  ... "
print gmail.inbox.count(:unread, :from => ":UNWANTED_EMAIL_ADDRESS") 
print "\n"
print "Fetching mails and deleting them ..."
gmail.inbox.emails(:unread, :from => ":UNWANTED_EMAIL_ADDRESS").each do |email|
   email.delete!
end

print " done."
puts " " 
gmail.logout