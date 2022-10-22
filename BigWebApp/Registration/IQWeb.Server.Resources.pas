unit IQWeb.Server.Resources;

interface

uses
  // Interfaces
  IQWeb.Session.RegServices
  , uniGUIForm
//  , DayHrs
//  , LAB_DTL
//  , LAB_Shft
//  , DAY_SHFT
//  , SELCLASS
//  , Cap_Main
//  , DAY_PART
//  , LAB_WO
  ;

type

  TFormDef = record
    ModuleClass : TClass;
    Singleton   : boolean;
    ImplInfs    : array of integer
  end;

  TNavNode = record
    Caption : string;
    Level   : integer;
    FormIdx : integer;
  end;

const

  IntfQty = 1;
  FormQty = 1;
  NodeQty = 1;

  FormDefs : array[1..FormQty] of TFormDef =
  (
    { 1 } (ModuleClass: TUniForm         ; Singleton: false)
//    { 2 } (ModuleClass: TFrmLabor_Details_Base ; Singleton: false),
//    { 3 } (ModuleClass: TFrmLabor_Shift        ; Singleton: false),
//    { 4 } (ModuleClass: TFrmProjectedHoursShift; Singleton: false),
//    { 5 } (ModuleClass: TFrmSelClass           ; Singleton: false),
//    { 6 } (ModuleClass: TUniCap_Main           ; Singleton: true ),
//    { 7 } (ModuleClass: TFrmShowDayParts       ; Singleton: false),
//    { 8 } (ModuleClass: TFrmLabor_WO           ; Singleton: false)
  );

  NavTree : array[1..NodeQty] of TNavNode =
  (
    (Caption: 'Home'         ; Level: 0; FormIdx: 0)
//    (Caption: 'Capacity'     ; Level: 1; FormIdx: 0),
//    (Caption: 'Capacity Main'; Level: 2; FormIdx: 6)
  );

var
  Intfs : array[1..IntfQty] of TGUID;

implementation

initialization


end.
