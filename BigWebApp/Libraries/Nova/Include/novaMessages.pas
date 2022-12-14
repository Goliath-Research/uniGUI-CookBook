unit novaMessages;

interface

uses
  Windows;

const

//EVENTS MESSAGES NAMES
  MSG_NOVAPDF2_STARTDOC   = 'NOVAPDF2_STARTDOC';
  MSG_NOVAPDF2_ENDDOC     = 'NOVAPDF2_ENDDOC';
  MSG_NOVAPDF2_STARTPAGE  = 'NOVAPDF2_STARTPAGE';
  MSG_NOVAPDF2_ENDPAGE    = 'NOVAPDF2_ENDPAGE';
  MSG_NOVAPDF2_FILESENT   = 'NOVAPDF2_FILESENT';
  MSG_NOVAPDF2_PRINTERROR = 'NOVAPDF2_PRINTERROR';
  MSG_NOVAPDF2_FILESAVED  = 'NOVAPDF2_FILESAVED';
  MSG_NOVAPDF2_EMAILSENT  = 'NOVAPDF2_EMAILSENT';
  MSG_NOVAPDF2_EMAILERROR = 'NOVAPDF2_EMAILERROR';

//ERROR CODES FOR NOVAPDF2_PRINTERROR MESSAGE
  ERROR_MSG_TEMP_FILE       =  1;
  ERROR_MSG_LIC_INFO        =  2;
  ERROR_MSG_SAVE_PDF        =  3;
  ERROR_MSG_JOB_CANCELED    =  4;
  ERROR_MSG_LIC_COPIES      =  5;
  ERROR_MSG_LIC_CLIENT      =  6;
  ERROR_MSG_SEND_EMAIL      =  7;
  ERROR_MSG_CONNECT_SRV     =  8;
  ERROR_MSG_JOB_INFO        =  9;
  ERROR_MSG_READ_PROFILE    = 10;
  ERROR_MSG_PDF_ENCRYPT_AP  = 11;
  ERROR_MSG_PDF_ENCRYPT_INS = 12;
  ERROR_MSG_PDF_APPEND      = 13;
  ERROR_MSG_PDF_INSERT      = 14;
  ERROR_MSG_OVERLAY_ENCRYPT = 15;
  ERROR_MSG_OVERLAY_READ    = 16;

var
  WM_NOVAPDF2_FILESAVED,
  WM_NOVAPDF2_PRINTERROR : Cardinal;

implementation

end.
