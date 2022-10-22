unit IQMS.Common.Repbomwo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, Vcl.Controls, uniFileUpload;

type
  TTFrmRepBomWo = class(TUniForm)
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    SrcMfg: TDataSource;
    tblMfg: TFDTable;
    tblMfgMFGTYPE: TStringField;
    tblMfgDESCRIP: TStringField;
    tblMfgBOM_REPORT: TStringField;
    tblMfgWO_REPORT: TStringField;
    tblMfgBEFORE_BOM_REPORT: TStringField;
    tblMfgBEFORE_WO_REPORT: TStringField;
    grid: TIQUniGridControl;
    dbReportBom: TUniEdit;
    QryAllProcsBom: TFDQuery;
    QryAllProcsBomOBJECT_NAME: TStringField;
    dbBeforeBom: TUniDBLookupComboBox;
    dbReportWo: TUniEdit;
    dbBeforeWo: TUniDBLookupComboBox;
    QryAllProcsWo: TFDQuery;
    StringField1: TStringField;
    UniFileUpload1: TUniFileUpload;
    procedure tblMfgBeforeInsert(DataSet: TDataSet);
    procedure dbReportBomCustomDlg(Sender: TObject);
    procedure dbReportWoCustomDlg(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoReportPropertiesBomWo;



implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  IQMS.Common.ResStrings;

procedure DoReportPropertiesBomWo;
begin
  with TTFrmRepBomWo.Create(uniGUIApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TTFrmRepBomWo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Grid]);
end;

procedure TTFrmRepBomWo.tblMfgBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TTFrmRepBomWo.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  if UniFileUpload1.Tag=1 then
   begin
     if (not Empty(AStream.FileName)) and (not FileExists(AStream.FileName)) then
          raise Exception.Create(Format(IQMS.Common.ResStrings.cTXT0000125 {'File %s not found'}, [AStream.FileName]));
       if not (tblMfg.State in [dsEdit]) then tblMfg.Edit;
       tblMfg.FieldByName('BOM_REPORT').AsString := UpperCase(ExtractFileName(AStream.FileName));
   end
  else if UniFileUpload1.Tag=2 then
   begin

       if (not Empty(AStream.FileName)) and (not FileExists(AStream.FileName)) then
          raise Exception.Create(Format(IQMS.Common.ResStrings.cTXT0000125 {'File %s not found'}, [AStream.FileName]));
       if not (tblMfg.State in [dsEdit]) then tblMfg.Edit;
       tblMfg.FieldByName('WO_REPORT').AsString := UpperCase(ExtractFileName(AStream.FileName));
   end;


end;

procedure TTFrmRepBomWo.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( true, self );
  IQRegFormRead(self, [self, Grid]);
  Caption := Format(IQMS.Common.ResStrings.cTXT0000235 {'%s Properties'}, [Caption]);
end;

procedure TTFrmRepBomWo.dbReportBomCustomDlg(Sender: TObject);
begin
  UniFileUpload1.Tag:=1;
  UniFileUpload1.FileName  := tblMfg.FieldByName('BOM_REPORT').AsString;
  UniFileUpload1.Execute;
end;

procedure TTFrmRepBomWo.dbReportWoCustomDlg(Sender: TObject);
begin
  UniFileUpload1.Tag:=2;
  UniFileUpload1.FileName  := tblMfg.FieldByName('WO_REPORT').AsString;
  UniFileUpload1.Execute;

end;


end.
