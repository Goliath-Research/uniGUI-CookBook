unit shipman_ups_custom_values;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmShipmanUPSCustomValues = class(TUniForm)
    pnlGrid: TUniPanel;
    GridCustomValues: TIQUniGridControl;
    tblCustomValues: TFDTable;
    srcCustomValues: TDataSource;
    tblCustomValuesID: TBCDField;
    tblCustomValuesCODE: TStringField;
    tblCustomValuesSERVICE_CODE: TStringField;
    tblCustomValuesTYPE: TBCDField;
    tblCustomValuesVALUE: TBCDField;
    cmbServiceCode: TUniDBComboBox;
    cmbType: TUniDBComboBox;
    qryCodes: TFDQuery;
    srcCodes: TDataSource;
    qryCodesDISPLAYNAME: TStringField;
    qryCodesCODE: TStringField;
    cmbCodes: TUniEdit;
    PkCodes: TIQWebHPick;
    PkCodesDISPLAYNAME: TStringField;
    tblCustomValuesDisplayName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cmbCodesCustomDlg(Sender: TObject);
    procedure tblCustomValuesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoUPSCustomValues: Boolean;

implementation
uses
  IQMS.Common.DataLib,
  ups_httplink_typelib;

{$R *.dfm}

function DoUPSCustomValues: Boolean;
var
  LFrmShipmanUPSCustomValues : TFrmShipmanUPSCustomValues;
begin
  LFrmShipmanUPSCustomValues := TFrmShipmanUPSCustomValues.Create(UniGUIApplication.UniApplication);
  Result := LFrmShipmanUPSCustomValues.ShowModal = mrOk;
end;


procedure TFrmShipmanUPSCustomValues.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  tblCustomValues.Open;
  ReOpen(qryCodes);
  try
     cmbServiceCode.Items.BeginUpdate;
     cmbServiceCode.Items.Clear;

       begin
         for i := Ord(Low(TUPSService)) to Ord(High(TUPSService)) do
           cmbServiceCode.Items.Add(Format( '%s'#9'%s',
                                        [UPS_ServiceCodeDescrip[TUPSService(i)],
                                         UPS_ServiceCode[TUPSService(i)]] ) );
       end;

  finally
     cmbServiceCode.Items.EndUpdate;
  end;
end;

procedure TFrmShipmanUPSCustomValues.cmbCodesCustomDlg(Sender: TObject);
begin
 if (TblCustomValues.State in [dsEdit,dsInsert]) then
    TblCustomValues.Post;

 with PkCodes do
  if Execute then
     begin
       TblCustomValues.Edit;
       tblCustomValuesCODE.AsString := GetValue('CODE');
       TblCustomValues.Post;
     end;

end;

procedure TFrmShipmanUPSCustomValues.tblCustomValuesBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

end.
