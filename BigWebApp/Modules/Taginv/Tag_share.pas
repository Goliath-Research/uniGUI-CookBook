unit Tag_share;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics;

const
  cTAG_WORKSHEET_FULL    = 'WS-FULL INV'   ;
  cTAG_WORKSHEET_CYCLE   = 'WS-CYCLE COUNT';
  cTAG_WORKSHEET_PROD    = 'WS-PROD NEED'  ;
  cTAG_WORKSHEET_CLASS   = 'WS-CLASS/LOC'  ;
  cTAG_WORKSHEET_UNKNOWN = 'UNKNOWN'       ;
  cTAG_TAGS_FULL         = 'TAGS-FULL'     ;

  cTAG_KIND_FULL = 'T';
  cTAG_KIND_WS   = 'W';

  cTAG_STATE_CANCELLED   = 'CANCELLED';
  cTAG_STATE_COUNT_BEGAN = 'COUNT BEGAN';
  cTAG_STATE_COMPARED    = 'COMPARED';
  cTAG_STATE_ADJUSTED    = 'ADJUSTED';
  cTAG_STATE_RECORDING   = 'RECORDING';

  cTAG_SELECT_FROM_START_MARK = '/*_FROM_START_*/';

  cTAG_ATTRIBUTE_CLASS = 'CLASS';
  cTAG_ATTRIBUTE_ITEM = 'ITEM';
  cTAG_ATTRIBUTE_CYCLE_COUNT = 'CYCLE COUNT';
  cTAG_ATTRIBUTE_REQUIRING_CYCLE_COUNT = 'REQUIRING CYCLE COUNT';

type
  TTagInvSelectionCritera = record
    SQL                : string;
    Method             : string;
    DoNotAutoCreateTags: Boolean;
    RequireAllCounted  : Boolean;
    EPlant_ID          : Real;
    Division_ID        : Real;
    MethodAttribute    : string;
    constructor Create( Dummy: Real );
  end;

function GetTagHeadSequenceName( ATagHead_ID: Real ): string;
function GetTagHeadNextSequenceNumber( ATagHead_ID: Real ): string;

function IsFullTagInvMethod( ATagHead_ID: Real = 0 ): Boolean;
function IsWorkSheetMethod( ATagHead_ID: Real = 0 ): Boolean;
function IsAllTagsCounted( ATagHead_ID: Real = 0): Boolean;
function IsAllTagsCountedRequired( ATagHead_ID: Real = 0): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  System.Variants;


function IsFullTagInvMethod( ATagHead_ID: Real = 0 ): Boolean;
var
  S: string;
begin
  IQAssert( ATagHead_ID > 0, 'TagHead ID must be specified in call to IsFullTagInvMethod method');
  S:= SelectValueByID('taginv_method', 'taghead', ATagHead_ID);
  // if SecurityManager.EPlant_ID = 'NULL' then
  //    S:= SelectValueAsString('select taginv_method from params')
  // else
  //    S:= SelectValueFmtAsString('select taginv_method from eplant where id = %s', [ SecurityManager.EPlant_ID ]);
  Result:= (S = cTAG_TAGS_FULL);
end;

function IsWorkSheetMethod( ATagHead_ID: Real = 0 ): Boolean;
begin
  IQAssert( ATagHead_ID > 0, 'TagHead ID must be specified in call to IsFullTagInvMethod method');
  Result:= not IsFullTagInvMethod(ATagHead_ID);
end;

function IsAllTagsCounted(ATagHead_ID: Real = 0): Boolean;
begin
  IQAssert( ATagHead_ID > 0, 'TagHead ID must be specified in call to IsFullTagInvMethod method');
  Result:= SelectValueFmtAsFloat('select 1 from taginv where taghead_id = %f and nvl(is_counted, ''N'') <> ''Y'' and rownum < 2', [ ATagHead_ID ]) = 0;
end;

function IsAllTagsCountedRequired(ATagHead_ID: Real = 0): Boolean;
var
  S: string;
begin
  IQAssert( ATagHead_ID > 0, 'TagHead ID must be specified in call to IsFullTagInvMethod method');
  S:= SelectValueByID('require_all_counted', 'taghead', ATagHead_ID);
  // if SecurityManager.EPlant_ID = 'NULL' then
  //    S:= SelectValueAsString('select taginv_require_all_counted from params')
  // else
  //    S:= SelectValueFmtAsString('select taginv_require_all_counted from eplant where id = %s', [ SecurityManager.EPlant_ID ]);
  Result:= (S = 'Y');
end;


function GetTagHeadSequenceName( ATagHead_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select tag_misc.get_taghead_seq_name( %f ) from dual', [ ATagHead_ID ]);
end;


function GetTagHeadNextSequenceNumber( ATagHead_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select tag_misc.get_taghead_next_sequence_numb( %f ) from dual', [ ATagHead_ID ]);
end;


{ TTagInvSelectionCritera }

constructor TTagInvSelectionCritera.Create( Dummy: Real );
begin
  SQL                := '';
  Method             := '';
  DoNotAutoCreateTags:= FALSE;
  RequireAllCounted  := FALSE;
  EPlant_ID          := SecurityManager.EPlant_ID_AsFloat;
  Division_ID        := 0;
end;

end.
