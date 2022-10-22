unit SchdDown;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox, System.Classes, Vcl.Controls;

type
  TAddDownTime = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    eDownReason: TUniEdit;
    eDownHrs: TUniEdit;
    rbAddBottom: TUniRadioButton;
    rbInsert: TUniRadioButton;
    ePos: TUniEdit;
    bbtnApply: TUniBitBtn;
    BitBtn2: TUniBitBtn;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwTable1: TFDTable;
    wwTable1DOWN_CODE: TStringField;
    wwTable1DOWN_DESCRIP: TStringField;
    wwTable1EPLANT_ID: TBCDField;
    QryDownCode: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure rbAddBottomClick(Sender: TObject);
    procedure bbtnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure wwTable1BeforeOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    CurrentEqNo     : string;
    CurrentCntr_Type: string;
    CurrentCntr_ID  : Real;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  //SchdAdd,  { TODO : Dependency }
  //Sched_mn;

procedure TAddDownTime.FormCreate(Sender: TObject);
begin
  ePos.Enabled:= rbInsert.Checked;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TAddDownTime.rbAddBottomClick(Sender: TObject);
begin
   ePos.Enabled:= rbInsert.Checked;
end;

procedure TAddDownTime.bbtnApplyClick(Sender: TObject);
var
  nSeq:integer;
  nHrs:Real;
begin
  nSeq:= 999;
//  if rbInsert.Checked then
//     SetInsertSeq( nSeq, ePos.Text );

  try
    nHrs:= StrToFloat( eDownHrs.Text );
    if nHrs <= 0.000001 then raise Exception.Create('')
  except
    //MessageDlg('Invalid Down Hours - Please ReEnter', mtError, [mbOK], 0);
    ABORT;
  end;

//  TFrm_MainSched(Owner).Child.AddJob( CurrentCntr_ID,
//                                      0,                   {workorder id}
//                                      nSeq,
//                                      nHrs,
//                                      0,                   {setup hrs}
//                                      1,                   {0 - regular workorder, 1 - downtime}
//                                      eDownReason.Text,
//                                      TRUE,                {With Refresh}
//                                      0 );                 {PMWO_ID }

  {and finally Close the form}
  Close;
end;

procedure TAddDownTime.FormShow(Sender: TObject);
begin
  Caption:= Format( 'Add Downtime: WorkCenter - %s, Type - %s', [CurrentEqNo, CurrentCntr_Type] );
end;

procedure TAddDownTime.wwDBLookupCombo1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if Modified then
  with TFDQuery(LookupTable) do
     eDownReason.Text:= Format( '%s // %s', [FieldByName('down_code').asString,
                                            FieldByName('down_descrip').asString ]);
end;

procedure TAddDownTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TAddDownTime.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TAddDownTime.wwTable1BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

end.

