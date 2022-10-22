unit crm_mail_common;

{ ** Common declarations and types used in CRM for e-mail.  **

  These are used when sending e-mail through Outlook, Lotus Notes,
  or Novell GroupWise.

}

interface

type TMailAction = ( maShow, maPrint, maReply, maReplyAll, maForward, maDelete );
type TMailItemRecord = record
   Body, SenderName, MsgTo, Subject, MsgCC: String;
end;

implementation

end.

