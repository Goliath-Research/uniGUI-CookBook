unit crm_const;

(* *** CRM Constants ***
 *
 *  This unit is to be used when executing COM calls to IQCRM.
 *
 *)

interface

uses
  System.Classes;

const
    // Constants used only for COM
    CRM_ACTIVITY                         = $00012C; {300}

    CRM_QUOTE                            = $00012D; {301}
    CUSTOMER_CENTRAL                     = $00012E; {302}
    VENDOR_CENTRAL                       = $00012F; {303}
    PARTNER_CENTRAL                      = $000130; {304}

    CRM_CALL                             = $000131; {305}
    CRM_TASK                             = $000132; {306}
    CRM_MEETING                          = $000133; {307}
    CRM_NOTE                             = $000134; {308}
    CRM_SUPPORT                          = $000135; {309}

    CRM_CALL_NEW                         = $000136; {310}
    CRM_TASK_NEW                         = $000137; {311}
    CRM_MEETING_NEW                      = $000138; {312}
    CRM_NOTE_NEW                         = $000139; {313}
    CRM_SUPPORT_NEW                      = $00013A; {314}

    CRM_CUSTOMER_CALL_NEW                = $00013B; {315}
    CRM_CONTACT_CALL_NEW                 = $00013C; {316}
    CRM_VENDOR_CALL_NEW                  = $00013D; {317}
    CRM_VENDOR_CONTACT_CALL_NEW          = $00013E; {318}
    CRM_PARTNER_CALL_NEW                 = $00013F; {319}
    CRM_PARTNER_CONTACT_CALL_NEW         = $000140; {320}
    CRM_EMPLOYEE_CALL_NEW                = $000141; {321}

    CRM_CUSTOMER_TASK_NEW                = $000142; {322}
    CRM_CONTACT_TASK_NEW                 = $000143; {323}
    CRM_VENDOR_TASK_NEW                  = $000144; {324}
    CRM_VENDOR_CONTACT_TASK_NEW          = $000145; {325}
    CRM_PARTNER_TASK_NEW                 = $000146; {326}
    CRM_PARTNER_CONTACT_TASK_NEW         = $000147; {327}
    CRM_EMPLOYEE_TASK_NEW                = $000148; {328}

    CRM_CUSTOMER_MEETING_NEW             = $000149; {329}
    CRM_CONTACT_MEETING_NEW              = $00014A; {330}
    CRM_VENDOR_MEETING_NEW               = $00014B; {331}
    CRM_VENDOR_CONTACT_MEETING_NEW       = $00014C; {332}
    CRM_PARTNER_MEETING_NEW              = $00014D; {333}
    CRM_PARTNER_CONTACT_MEETING_NEW      = $00014E; {334}
    CRM_EMPLOYEE_MEETING_NEW             = $00014F; {335}

    CRM_CUSTOMER_NOTE_NEW                = $000150; {336}
    CRM_CONTACT_NOTE_NEW                 = $000151; {337}
    CRM_VENDOR_NOTE_NEW                  = $000152; {338}
    CRM_VENDOR_CONTACT_NOTE_NEW          = $000153; {339}
    CRM_PARTNER_NOTE_NEW                 = $000154; {340}
    CRM_PARTNER_CONTACT_NOTE_NEW         = $000155; {341}
    CRM_EMPLOYEE_NOTE_NEW                = $000156; {342}

    CRM_CUSTOMER_SUPPORT_NEW             = $000157; {343}
    CRM_CONTACT_SUPPORT_NEW              = $000158; {344}
    CRM_VENDOR_SUPPORT_NEW               = $000159; {345}
    CRM_VENDOR_CONTACT_SUPPORT_NEW       = $00015A; {346}
    CRM_PARTNER_SUPPORT_NEW              = $00015B; {347}
    CRM_PARTNER_CONTACT_SUPPORT_NEW      = $00015C; {348}
    CRM_EMPLOYEE_SUPPORT_NEW             = $00015D; {349}

    CRM_OPPORTUNITY                      = $00015E; {350}
    CRM_OPPORTUNITY_NEW                  = $00015F; {351}

    CRM_DELETE_ACTIVITY                  = $000160; {352}
    CRM_SALES_CONFIG                     = $000161; {353}

    CRM_ACTIVITY_EVENT                   = $000162; {354}

    CRM_CAMPAIGN                         = $000163; {355}

    CRM_QUOTE_DETAIL                     = $000164; {356}

    CRM_GR0UPS                           = $000165; {357}
    CRM_SERVICE_CENTRAL                  = $000166; {358}
    CRM_MASS_MAIL                        = $000167; {359}
    CRM_MAIL_MERGE                       = $00016C; {364}

    CRM_WORKFLOW                         = $000168; {360}

    CRM_DISTLIST_CUSTOMER                = $000169; {361}
    CRM_DISTLIST_VENDOR                  = $00016A; {362}
    CRM_DISTLIST_EMPLOYEE                = $00016B; {363}

    CRM_CALENDAR                         = $00016D; {365}
    CRM_HOLIDAYS                         = $000173; {371}
    CRM_SCHEDULE_COORDINATOR             = $00016E; {366}

    CRM_CALL_TYPES                       = $00016F; {367}
    CRM_TASK_TYPES                       = $000170; {368}
    CRM_MEETING_TYPES                    = $000171; {369}
    CRM_SUPPORT_TYPES                    = $000172; {370}
(*








$000174; {372}
$000175; {373}
$000176; {374}
$000177; {375}
$000178; {376}
$000179; {377}
$00017A; {378}
$00017B; {379}
$00017C; {380}
$00017D; {381}
$00017E; {382}
$00017F; {383}
$000180; {384}
$000181; {385}
$000182; {386}
$000183; {387}
$000184; {388}
$000185; {389}
$000186; {390}
$000187; {391}
$000188; {392}
$000189; {393}
$00018A; {394}
$00018B; {395}
$00018C; {396}
$00018D; {397}
$00018E; {398}
$00018F; {399}
$000190; {400}

*)

implementation

end.
