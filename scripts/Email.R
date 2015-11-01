library(sendmailR)


#####send plain email
sendMail <- function(path, file){
  from <- "hari.manivannan@gmail.com"
  to <- "hari@mstsolutions.com"
  subject <- "Submission"
  body <- "Email body."                     
  mailControl=list(smtpServer="serverinfo")
  
  sendmail(from=from,to=to,subject=subject,msg=body,control=mailControl)
  
  #####send same email with attachment
  
  #needs full path if not in working directory
  attachmentPath <- path
  
  #same as attachmentPath if using working directory
  attachmentName <- file
  
  #key part for attachments, put the body and the mime_part in a list for msg
  attachmentObject <- mime_part(x=attachmentPath,name=attachmentName)
  bodyWithAttachment <- list(body,attachmentObject)
  
  sendmail(from=from,to=to,subject=subject,msg=bodyWithAttachment,control=mailControl)
}
