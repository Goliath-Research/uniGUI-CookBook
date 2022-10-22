unit CloneAKA;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.About,
  Mask,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCloneAKA = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    GroupBox1: TUniGroupBox;
    QryAka: TFDQuery;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Clone1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    N1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryAkaID: TBCDField;
    QryAkaARINVT_ID: TBCDField;
    QryAkaCUST_ITEMNO: TStringField;
    QryAkaCUST_DESCRIP: TStringField;
    QryAkaARCUSTO_ID: TBCDField;
    QryAkaPRICE_PER_1000: TStringField;
    QryAkaCOMIS_PRCNT: TFMTBCDField;
    QryAkaCURRENCY_ID: TBCDField;
    QryAkaECODE: TStringField;
    QryAkaINFO_SO: TStringField;
    QryAkaSHIP_TO_ID: TBCDField;
    QryAkaCUSTOMER: TStringField;
    QryAkaCUSTNO: TStringField;
    QryAkaSUPPLIER_CODE: TStringField;
    QryAkaSHIP_TO_ATTN: TStringField;
    QryAkaSHIP_TO_CITY: TStringField;
    QryAkaITEMNO: TStringField;
    QryAkaDESCRIP: TStringField;
    QryAkaDESCRIP2: TStringField;
    QryAkaCLASS: TStringField;
    QryAkaEPLANT_ID: TBCDField;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    dbeUserId: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    SrcAKA: TDataSource;
    QryAkaREV: TStringField;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Splitter3: TUniSplitter;
    Panel8: TUniPanel;
    Label6: TUniLabel;
    Label9: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    Splitter4: TUniSplitter;
    Panel9: TUniPanel;
    Splitter5: TUniSplitter;
    Panel10: TUniPanel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    DBEdit10: TUniDBEdit;
    DBEdit11: TUniDBEdit;
    BtnExit: TUniButton;
    BtnClone: TUniButton;
    IQSearch1: TIQUniGridControl;
    QryShipTo: TFDQuery;
    SrcShipTo: TDataSource;
    QryShipToID: TBCDField;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToADDR3: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToPRIME_CONTACT: TStringField;
    QryShipToEPLANT_ID: TBCDField;
    Label13: TUniLabel;
    DBEdit12: TUniDBEdit;
    Panel11: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure BtnCloneClick(Sender: TObject);
  private
    { Private declarations }
    FAkaId:Real;
  public
    { Public declarations }
  end;

procedure IQCloneAKA( AkaID:Real );


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  inv_rscstr,
  IQMS.Common.Dialogs;
{$R *.dfm}

procedure IQCloneAKA( AkaID:Real );
var
  FrmCloneAKA: TFrmCloneAKA;
begin
  FrmCloneAKA := TFrmCloneAKA.Create(uniGUIApplication.UniApplication);
  with FrmCloneAKA do
  begin
      //IQRegFormRead( self, [ self, Panel4, Panel7, Panel9 ]);
      FAkaId := AkaId;
      QryAka.ParamByName('AID').Value := FAkaId;
      QryAka.Open;
      QryShipTo.ParamByName('ARCUSTO_ID1').Value := QryAkaARCUSTO_ID.asFloat;
      QryShipTo.ParamByName('AEplantID').Value := QryAkaEPLANT_ID.asFloat;
      if QryAkaEPLANT_ID.asFloat = 0 then
        QryShipTo.ParamByName('ADummy').Value := 1
      else
        QryShipTo.ParamByName('ADummy').Value := 0;
      QryShipTo.ParamByName('ARCUSTO_ID2').Value := QryAkaARCUSTO_ID.asFloat;
      QryShipTo.ParamByName('ARINVT_ID1').Value :=  QryAkaARINVT_ID.asFloat;
      QryShipTo.Open;
  end;

  FrmCloneAKA.ShowModal;

end;

procedure TFrmCloneAKA.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
 // IQRegFormWrite( self, [ self, Panel4, Panel7, Panel9 ]);
end;

procedure TFrmCloneAKA.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCloneAKA.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCloneAKA.BtnCloneClick(Sender: TObject);
var
  I:integer;
  AStr:String;
begin
  if IqSearch1.IQComponents.Grid.SelectedRows.Count = 0 then
    raise Exception.Create(inv_rscstr.cTXT0000155);

  if not IqConfirmYN(inv_rscstr.cTXT0000154) then exit;

  with IqSearch1.IQComponents.Grid, IqSearch1.IQComponents.Grid.DataSource.DataSet do
    begin
      for i:= 0 to SelectedRows.Count-1 do begin
      GotoBookmark(SelectedRows.items[i]);
            if IqSearch1.IQComponents.Grid.SelectedRows.Count = 1 then
              AStr := IntToStr(Trunc(QryShipToID.asFloat))
            else
              AStr := IntToStr(Trunc(QryShipToID.asFloat)) + '*' + AStr;
      end;
    end;

  if IqSearch1.IQComponents.Grid.SelectedRows.Count <> 1 then
    AStr := Copy(AStr, 1, Length(AStr) - 1);

  ExecuteCommandFmt('begin aka_misc.CloneShipTos(''%s'', %f); end;', [AStr, FAkaId]);
  IQInformation(inv_rscstr.cTXT0000156);
  Close;
end;



end.
