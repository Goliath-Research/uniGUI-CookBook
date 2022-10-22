unit Dwn_main;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UDComboBox,
  Mask,
  IQMS.WebVcl.UserDefinedLabel,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMultiItem, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame, uniLabel, Vcl.Controls;

type
  TFrmDownCodes = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    SrcDownCodes: TDataSource;
    SR: TIQWebSecurityRegister;
    IQUserDefLabelCUser1: TIQWebUserDefLabel;
    IQUserDefLabelCUser2: TIQWebUserDefLabel;
    wwDBGrid1: TIQUniGridControl;
    FDUpdateSQLDownCode: TFDUpdateSQL;
    TblDownCodes: TFDQuery;
    TblDownCodesDOWN_CODE: TStringField;
    TblDownCodesDOWN_DESCRIP: TStringField;
    TblDownCodesEPLANT_ID: TBCDField;
    TblDownCodesIS_CHARGEABLE: TStringField;
    TblDownCodesIS_PLANNED: TStringField;
    TblDownCodesIS_SETUP: TStringField;
    TblDownCodesPK_HIDE: TStringField;
    TblDownCodesCUSER1: TStringField;
    TblDownCodesCUSER2: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure TblDownCodesBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblDownCodesBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: string);
  private
    procedure UpdateUserLabelColumnTitle(AFieldName, ATitleText: string);
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowDownCodes;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Boolean,
  IQMS.COmmon.SetPlant;

procedure ShowDownCodes;
begin
  with TFrmDownCodes.Create(UniApplication) do
  begin
    TblDownCodes.Open;
    ShowModal;
  end;
end;

procedure TFrmDownCodes.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDownCodes.TblDownCodesBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

procedure TFrmDownCodes.FormCreate(Sender: TObject);
begin
  TblDownCodesEPLANT_ID.Visible := SR.Visible[ 'TblDownCodesEPLANT_ID' ];
//  if not SR.Visible[ 'TblDownCodesEPLANT_ID' ] then
//     IQMS.Common.Controls.EnsureWWColumnRemoved( wwDBGrid1, 'EPLANT_ID' );

  UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelCUser1.Caption );
  UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelCUser2.Caption );

  IQRegFormRead(self, [self, wwdbGrid1]);
end;

procedure TFrmDownCodes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGrid1]);
end;

procedure TFrmDownCodes.TblDownCodesBeforePost(DataSet: TDataSet);
begin
  // Sep 11 2006 - Restriction has been removed. Setup will not be included in runs best by default - only if the user wants it included as a chargeable downtime.

  // if (TblDownCodesIS_CHARGEABLE.asString <> 'Y') then
  //    EXIT;
  //
  // if TblDownCodesDOWN_CODE.asString = '' then
  //    EXIT;
  //
  // IQAssert( TblDownCodesDOWN_CODE.asString <> SelectValueAsString('select rt_down_code from params'),
  //           'This downtime code is already chargeable since it''s selected as a default Setup Code in RealTime.')

  IQAssert( Trim(TblDownCodesDOWN_CODE.asString) <> '', 'Down Time code must be entered - operation aborted.');
end;


procedure TFrmDownCodes.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  IQAssert( SR.ReadWrite[ 'TblDownCodesEPLANT_ID' ], 'Insufficient rights - access denied ...' );
  DoChangePlantID(  TblDownCodes );    {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmDownCodes.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  if AFieldName = 'CUSER1' then
     begin
       IQUserDefLabelCUser1.Execute;
       UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelCUser1.Caption );
     end
  else if AFieldName = 'CUSER2' then
     begin
       IQUserDefLabelCUser2.Execute;
       UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelCUser2.Caption );
     end
end;


procedure TFrmDownCodes.UpdateUserLabelColumnTitle( AFieldName, ATitleText: string);
var
 i:integer;
begin
  TblDownCodes.FieldByName(AFieldName).DisplayLabel:= ATitleText;
  for i := 0 to wwDBGrid1.DBGrid.Columns.Count-1 do
     begin
       if wwDBGrid1.DBGrid.Columns[i].FieldName=AFieldName then
        begin
         wwDBGrid1.DBGrid.Columns[i].Title.Caption := ATitleText;
         break;
        end;

     end;
end;


end.
