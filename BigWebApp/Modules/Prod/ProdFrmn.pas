unit Prodfrmn;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Db,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  Wwdatsrc,
  DBCtrls,
  Buttons,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox;

type
  TFrmForman = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    QryForman: TFDQuery;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    wwDBLookupComboForeMan: TUniDBLookupComboBox;
    cbAll: TUniCheckBox;
    Bevel1: TUniPanel;
    Panel6: TUniPanel;
    sbtnEditForeman: TUniSpeedButton;
    QryFormanNAME: TStringField;
    QryFormanMFG_TYPE: TStringField;
    QryFormanSHIFT: TBCDField;
    Bevel2: TUniPanel;
    SrcForman: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryFormanBeforeOpen(DataSet: TDataSet);
    procedure sbtnEditForemanClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FMfgType:String;
    FShift:Integer;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure SetMfgType(const Value: String);
    procedure SetShift(const Value: Integer);
  public
    { Public declarations }
    Fforeman:String;
    property MfgType:String write SetMfgType;
    property Shift:Integer write SetShift;
  end;

function DoChooseForeman(AMfgType:String; AShift:Integer; var AForeman: string ): Boolean;



implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.HelpHook,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //foreman_main,
  Variants;

function DoChooseForeman( AMfgType:String; AShift:Integer; var AForeman: string ): Boolean;
var
  FrmForman: TFrmForman;
begin
  FrmForman := TFrmForman.Create( uniGUIApplication.uniApplication );
  with FrmForman do
  begin
    try
      MfgType := AMfgType;
      Shift   := AShift;
      Result:= ShowModal = mrOK;
      if Result then
         AForeman:= FForeman;
    finally
      //Free;
    end;
  end;
end;

procedure TFrmForman.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmForman.UniFormShow(Sender: TObject);
begin
   Caption := Format('Mfg Type: %s Shift: %d', [FMfgType ,FShift]);
   IQSetTablesActive( TRUE, self );
end;

procedure TFrmForman.QryFormanBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   if cbAll.Checked then
  //      begin
  //        ParamByName('mfg_type').Clear;
  //        ParamByName('shift').asFloat:= 0;
  //      end
  //   else
  //      begin
  //        ParamByName('mfg_type').asString:= Trim(FMfgType);
  //        ParamByName('shift').asFloat    := FShift;
  //      end;
  // end;
  if cbAll.Checked then
     begin
       AssignQueryParamValue( DataSet, 'mfg_type', Null );
       AssignQueryParamValue( DataSet, 'shift', 0 );
     end
  else
     begin
       AssignQueryParamValue( DataSet, 'mfg_type', Trim(FMfgType));
       AssignQueryParamValue( DataSet, 'shift',    FShift);
     end;
end;

procedure TFrmForman.sbtnEditForemanClick(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on foreman_main}
  //TFrmForemanMain.DoShow( self );  // foreman_main.pas
end;


procedure TFrmForman.SetMfgType(const Value: String);
begin
  FMfgType := Value;
  if Empty(FMfgType) then
     FMfgType := 'GENERIC';
end;

procedure TFrmForman.SetShift(const Value: Integer);
begin
  FShift := Value;
  if FShift < 1 then
     FShift := 1;
end;

procedure TFrmForman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmForman.IQNotify(var Msg: TMessage);
begin
  cbAllClick( nil );
end;

procedure TFrmForman.btnOkClick(Sender: TObject);
var
  AText: string;
begin
  AText:= UpperCase( wwDBLookupComboForeMan.Text );
  if Empty(Trim( AText )) then
     raise Exception.Create('Field ''Foreman'' cannot be blank - operation aborted');

  FForeman   := AText;
  ModalResult:= mrOk;
end;

procedure TFrmForman.cbAllClick(Sender: TObject);
begin
  Reopen( QryForman );

  if (wwDBLookupComboForeMan.Text > '') and not QryForman.Locate('name', wwDBLookupComboForeMan.Text, []) then
     wwDBLookupComboForeMan.Text:= '';
end;

procedure TFrmForman.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
