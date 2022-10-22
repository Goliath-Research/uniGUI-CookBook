unit IQMS.Common.QC_Const;

interface

// Last added constant: 50

const
    {doc}
    QC_DOC_MAINT                 = 1;
    QC_DOC_TEAM_MAINT            = 2;
    QC_DOC_INSERT_NEW_DOC        = 3;
    QC_DOC_EVALWORKFLOW          = 4;
    QC_DOC_DISPLAY_DOCUMENT      = 33;
    QC_DOC_REINDEX               = 37;
    QC_DOC_INSERT_NEW_DOC_PROMPT = 47;
    QC_DOC_REINDEX_KNOWLEDGEBASE = 48;
    QC_DOC_INSERT_NEW_DOC_EX     = 50;
                    
    {car}
    QC_CAR_TEMPLATE_MAINT        = 5;
    QC_CAR_MAINT                 = 6;
    QC_CAR_EVALWORKFLOW          = 7;
    QC_CAR_NEW                   = 43;
    QC_CAR_NEW_ASSIGN_RMA        = 9;
    QC_CAR_NEW_ASSIGN_VENDOR_RMA = 10;
    QC_CAR_NEW_ASSIGN_MRB_ITEM   = 11;
    QC_CAR_NEW_ASSIGN_CRM_ITEMS  = 31;

    {capa}
    QC_CAPA_MAINT                = 12;
    QC_CAPA_NEW                  = 44;
    QC_CAPA_NEW_ASSIGN_CRM_ITEMS = 32;
    QC_CAPA_NEW_ASSIGN_MRB_ITEM  = 34;
    QC_CAPA_NEW_ASSIGN_RMA       = 35;
    QC_CAPA_NEW_ASSIGN_VENDOR_RMA= 36;

    {eco}
    QC_ECO_MAINT                 = 13;
    QC_ECO_EVALWORKFLOW          = 14;
    QC_ECO_NEW                   = 46;

    {apqp}
    QC_APQP_MAINT                = 15;
    QC_APQP_EVALWORKFLOW         = 16;
    QC_APQP_INSERT_NEW           = 17;

    {proc_pq}
    QC_PROC_PQ_MAINT             = 18;
    QC_PROC_PQ_INSERT_NEW        = 28;

    {ppap}
    QC_PPAP_MAINT                = 19;
    QC_PPAP_EVALWORKFLOW         = 20;

    {prod_pq}
    QC_PROD_PQ_MAINT             = 21;

    {apqp}
    QC_APQP_PQ_MAINT             = 22;

    {deviation}
    QC_DEVIATION_MAINT           = 23;
    QC_DEVIATION_EVALWORKFLOW    = 24;
    QC_DEVIATION_NEW_ASSIGN_MRB_ITEM = 30;
    QC_DEVIATION_NEW_ASSIGN_CAR  = 40;

    {mrb}
    QC_MRB_MAINT                 = 25;
    QC_MRB_INSERT_NEW            = 26;
    QC_MRB_NEW_ASSIGN_CAR_ITEM   = 38;
    QC_MRB_NEW_ASSIGN_CAPA_ITEM  = 39;
    QC_MRB_INSERT_NEW_HEADER     = 42;
    QC_MRB_INSERT_NEW_EX         = 45;
    QC_MRB_INSERT_NEW_EX_2       = 51;
                                     
    {scanning}
    QC_DOC_INSERT_NEW_SCAN_IMAGE = 27;

    {Quality Audit}
    QC_AUDIT                     = 41;
    QC_AUDIT_WORKFLOW            = 49;

    {for team members template}
    QC_SOURCE_APQP_TYPE_ELEMENT = 'APQP_TYPE_ELEMENT';
    QC_SOURCE_PPAP_TYPE_ELEMENT = 'PPAP_TYPE_ELEMENT';
    QC_SOURCE_ECO_TYPE_ELEMENT  = 'ECO_TYPE_ELEMENT';
    QC_SOURCE_CAR_TYPE_ELEMENT  = 'CAR_TYPE_ELEMENT';

    {cost of quality}
    QC_GENERAL_COQ              = 29;


type
  TWorkflowState = (wsUnknown, wsInProgress, wsApproved, wsRejected );

implementation

end.
