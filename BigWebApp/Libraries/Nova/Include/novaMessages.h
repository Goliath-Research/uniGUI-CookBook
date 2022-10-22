#ifndef __NOVA_EVENTS_MESSAGES__
#define __NOVA_EVENTS_MESSAGES__

//------------------------------------------------------------------------------------------------------------------
//EVENTS MESSAGES NAMES
//------------------------------------------------------------------------------------------------------------------
#define MSG_NOVAPDF2_STARTDOC   L"NOVAPDF2_STARTDOC"
#define MSG_NOVAPDF2_ENDDOC     L"NOVAPDF2_ENDDOC"
#define MSG_NOVAPDF2_STARTPAGE  L"NOVAPDF2_STARTPAGE"
#define MSG_NOVAPDF2_ENDPAGE    L"NOVAPDF2_ENDPAGE"
#define MSG_NOVAPDF2_FILESENT   L"NOVAPDF2_FILESENT"
#define MSG_NOVAPDF2_PRINTERROR L"NOVAPDF2_PRINTERROR"
#define MSG_NOVAPDF2_FILESAVED  L"NOVAPDF2_FILESAVED"
#define MSG_NOVAPDF2_EMAILSENT  L"NOVAPDF2_EMAILSENT"
#define MSG_NOVAPDF2_EMAILERROR L"NOVAPDF2_EMAILERROR"
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------
//ERROR CODES FOR NOVAPDF2_PRINTERROR MESSAGE
//------------------------------------------------------------------------------------------------------------------
#define ERROR_MSG_PRINT_PROCESS 0
#define ERROR_MSG_TEMP_FILE    1
#define ERROR_MSG_LIC_INFO     2
#define ERROR_MSG_SAVE_PDF     3
#define ERROR_MSG_JOB_CANCELED 4
#define ERROR_MSG_LIC_COPIES   5
#define ERROR_MSG_LIC_CLIENT   6
#define ERROR_MSG_SEND_EMAIL   7
//#define ERROR_MSG_CONNECT_SRV  8

#define ERROR_MSG_JOB_INFO         9  //could not read printer info
#define ERROR_MSG_READ_PROFILE    10  //could nor read profile

#define ERROR_MSG_PDF_ENCRYPT_AP  11  //append pdf file - no or wrong password
#define ERROR_MSG_PDF_ENCRYPT_INS 12  //insertto pdf file - no or wrong password
#define ERROR_MSG_PDF_APPEND      13  //append pdf file - could not read file
#define ERROR_MSG_PDF_INSERT      14  //insertto pdf file - could not read file
#define ERROR_MSG_OVERLAY_ENCRYPT 15  //overlay pdf file - no or wrong password
#define ERROR_MSG_OVERLAY_READ    16  //overlay pdf file - could not read file

//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------

#endif //__NOVA_EVENTS_MESSAGES__