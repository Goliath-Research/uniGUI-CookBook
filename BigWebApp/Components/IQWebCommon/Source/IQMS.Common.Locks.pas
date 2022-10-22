unit IQMS.Common.Locks;

interface

  const
    {LockMode}
    IQLOCK_SHARED    = 4;
    IQLOCK_EXCLUSIVE = 6;

    {LockName}
    IQMS_IQWIN32            = 'IQMS-IQWin32';
    IQMS_IRV32              = 'IQMS-IRV32';
    IQMS_CAPACITY           = 'IQMS-Capacity';
    IQMS_FRL                = 'IQMS-FRL';
    IQMS_EXP                = 'IQMS-EXP';
    IQMS_EXPDP              = 'IQMS-EXPDP';
    IQMS_DOC_LIBRARY        = 'IQMS-DOC_LIBRARY';
    IQMS_EXTERNAL_DOC       = 'IQMS-EXTERNAL_DOC';
    IQMS_AR_POST_ALL        = 'IQMS-AR_POST_ALL';
    IQMS_IQALERT            = 'IQMS-IQALERT';
    IQMS_EDI_CONVERT        = 'IQMS-EDI_CONVERT';
    IQMS_PLM_PROJECT        = 'IQMS-PLM_PROJECT';
    IQMS_OE_COMPRESS        = 'IQMS_OE_COMPRESS';
    IQMS_PO_COMPRESS        = 'IQMS_PO_COMPRESS';
    IQMS_DOC_SEARCH_INDEX   = 'IQMS_DOC_SEARCH_INDEX';
    IQMS_PIT                = 'IQMS_PIT';
    IQMS_PM_CAPACITY        = 'IQMS_PM_CAPACITY';
    IQMS_RTLABEL            = 'IQMS-RTLABEL';
    IQMS_HEIJUNKA           = 'IQMS-HEIJUNKA';
    IQMS_PRW                = 'IQMS-PRW';
    IQMS_CREDIT_CARD_PURGE  = 'IQMS-CREDIT_CARD_RETENTION_PERIOD_PURGE';
    IQMS_AUTO_LOAD          = 'IQMS-AUTO_LOAD';
    
implementation

end.
