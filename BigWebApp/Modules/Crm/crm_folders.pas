unit crm_folders;

{ CRM Types and Constants used for Folders }

interface

uses
  System.Classes;

const
     // Main form Group name constants:
     // these values are used in the Data property of the
     // select tree view item to identify which group of list view icons are
     // showing.
     hMYCRMTODAY                = $0064;
     hMYCALLS                   = $0065;
     hMYTASKS                   = $0066;
     hMYMEETINGS                = $0067;
     hMYNOTES                   = $0068;
     hMYSUPPORT                 = $0069;
     hCRMTODAY                  = $006A;
     hACTIVITY                  = $006B;
     hSUPPORT                   = $006C;   // Main node for Support Issues
     hSUPPORT_ALL               = $006D;   // Subnode for All Meetings. Displays the details list view.
     hSUPPORT_OPEN              = $006E;   // Subnode for Open Meetings. Displays the details list view.
     hSUPPORT_CLOSED            = $006F;   // Subnode for Closed Meetings. Displays the details list view.
     hSUPPORT_NEW               = $0070;
     hSUPPORTQUEUEVIEW          = $0071;
     hSEARCHSUPPORT             = $0072;
     hCALLS                     = $0073;   // The main node for all calls
     hCALLS_ALL                 = $0074;   // Subnode for All Calls. Displays the details list view.
     hCALLS_OPEN                = $0075;   // Subnode for Open Calls. Displays the details list view.
     hCALLS_CLOSED              = $0076;   // Subnode for Closed Calls. Displays the details list view.
     hCALLS_NEW                 = $0077;
     hTASKS                     = $0078;   // The main node for all Tasks
     hTASKS_ALL                 = $0079;   // Subnode for All Tasks. Displays the details list view.
     hTASKS_OPEN                = $007A;   // Subnode for Open Tasks. Displays the details list view.
     hTASKS_CLOSED              = $007B;   // Subnode for Closed Tasks. Displays the details list view.
     hTASKS_NEW                 = $007C;
     hMEETINGS                  = $007D;   // The main node for all Meetings
     hMEETINGS_ALL              = $007E;   // Subnode for All Meetings. Displays the details list view.
     hMEETINGS_OPEN             = $007F;   // Subnode for Open Meetings. Displays the details list view.
     hMEETINGS_CLOSED           = $0080;   // Subnode for Closed Meetings. Displays the details list view.
     hMEETINGS_NEW              = $0081;
     hNOTES                     = $0082;
     hNOTES_ALL                 = $0083;   // Subnode for All Meetings. Displays the details list view.
     hNOTES_OPEN                = $0084;   // Subnode for Open Meetings. Displays the details list view.
     hNOTES_CLOSED              = $0085;   // Subnode for Closed Meetings. Displays the details list view.
     hNOTES_NEW                 = $0086;
     hACTIVITY_OUTLOOK_TASKS    = $0087;
     hACTIVITY_OUTLOOK_CALENDAR = $0088;
     hGROUPINGANDMAILING        = $0089;
     hALERTMESSAGES             = $008A;
     hSCHEDULECOORDINATOR       = $008B;
     hCALENDAR                  = $008C;
     hPARTNERS_NEW              = $008D;
     hCRMQUOTE_NEW              = $008E;
     hCUSTOMERCENTRAL           = $008F;
     hPARTNERS                  = $0090;
     hVENDORCENTRAL             = $0091;
     hCRMQUOTES                 = $0092;
     hACTIVITYASSIGNMENT        = $0093;
     hCRMGROUPS                 = $0094;
     hMASSMAIL                  = $0095;
     hMAILMERGE                 = $0096;
     hMARKETING                 = $0097;
     hCUSTALERTS                = $0098;
     hCONTALERTS                = $0099;
     hPARTNERALERTS             = $009A;
     hPARTNERCONTALERTS         = $009B;
     hIQINFO                    = $009C;
     hCUSTMAINT                 = $009D;
     hCUSTSTATUS                = $009E;
     hCUSTCONTACTS              = $009F;
     hCUSTINVENTORY             = $00A0;
     hCUSTINVAVAIL              = $00A1;
     hCUSTRMA                   = $00A2;
     hCUSTORDERS                = $00A3;
     hCUSTSHIPMENTS             = $00A4;
     hCUSTBOMQUOTES             = $00A5;
     hCUSTCRMQUOTES             = $00A6;
     hCUSTWEBORDER              = $00A7;
     hVENDORMAINT               = $00A8;
     hVENDORSTATUS              = $00A9;
     hVENDORCONTACTS            = $00AA;
     hWORKFLOW                  = $00AB;
     hWARRANTY                  = $00AC;
     hCAMPAIGN                  = $00AD;
     hANSWERBOOK                = $00AE;
     hANSWERBOOKNEW             = $00AF;
     hANSWERBOOKSEARCH          = $00B0;
     hANSWERBOOK_ORACLE         = $00B1;
     hOUTLOOK                   = $00B2;
     hOUTLOOK_CALENDAR          = $00B3;
     hOUTLOOK_CONTACTS          = $00B4;
     hOUTLOOK_DELETED           = $00B5;
     hOUTLOOK_DRAFTS            = $00B6;
     hOUTLOOK_INBOX             = $00B7;
     hOUTLOOK_JOURNAL           = $00B8;
     hOUTLOOK_NOTES             = $00B9;
     hOUTLOOK_OUTBOX            = $00BA;
     hOUTLOOK_SENT              = $00BB;
     hOUTLOOK_TASKS             = $00BC;

     hLOTUSNOTES                = $00BD;
     hLOTUSNOTES_CALENDAR       = $00BE;
     hLOTUSNOTES_CONTACTS       = $00BF;
     hLOTUSNOTES_DELETED        = $00C0;
     hLOTUSNOTES_DRAFTS         = $00C1;
     hLOTUSNOTES_INBOX          = $00C2;
     hLOTUSNOTES_JOURNAL        = $00C3;
     hLOTUSNOTES_NOTES          = $00C4;
     hLOTUSNOTES_SENT           = $00C5;
     hLOTUSNOTES_TASKS          = $00C6;
     hACTIVITY_LOTUSNOTES_CALENDAR = $00C7;
     hACTIVITY_LOTUSNOTES_TASKS = $00C8;

     hSALES_CONFIG_TEMPLATES    = $00C9;

//$00CA
//$00CB
//$00CC
//$00CD
//$00CE
//$00CF
//$00D0
//$00D1
//$00D2
//$00D3
//$00D4
//$00D5
//$00D6
//$00D7
//$00D8
//$00D9
//$00DA
//$00DB
//$00DC

     cActivityFolders = [hCALLS, hCALLS_ALL, hCALLS_OPEN, hCALLS_CLOSED,
                        hTASKS, hTASKS_ALL, hTASKS_OPEN, hTASKS_CLOSED,
                        hMEETINGS, hMEETINGS_ALL, hMEETINGS_OPEN, hMEETINGS_CLOSED,
                        hNOTES, hNOTES_ALL, hNOTES_OPEN, hNOTES_CLOSED];

implementation

end.

