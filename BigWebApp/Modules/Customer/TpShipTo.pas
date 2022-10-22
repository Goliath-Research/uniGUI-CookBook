unit TpShipTo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu;

type
  TFrmTPShipTo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniBitBtn;
    BtnSelect: TUniBitBtn;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlShipTo01: TUniPanel;
    Splitter27: TUniSplitter;
    PnlShipToLeft01: TUniPanel;
    Label36: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    Label39: TUniLabel;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label42: TUniLabel;
    Label56: TUniLabel;
    PnlShipToClient01: TUniPanel;
    dbeShipCity: TUniDBEdit;
    dbeShipAddr3: TUniDBEdit;
    dbeShipAddr2: TUniDBEdit;
    dbeShipAddr1: TUniDBEdit;
    dbeShipCompany: TUniDBEdit;
    dbeShipZIP: TUniDBEdit;
    dbeState: TUniDBEdit;
    dbeCountry: TUniDBEdit;
    dbeID: TUniDBEdit;
    dbeEplant: TUniDBEdit;
    dbeDivision: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Edit1: TUniEdit;
    Label4: TUniLabel;
    SrcShip_to: TDataSource;
    QryShipTo: TFDQuery;
    QryShipToID: TBCDField;
    QryShipToARCUSTO_ID: TBCDField;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToADDR3: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToEPLANT_ID: TBCDField;
    QryShipToDIVISION_ID: TBCDField;
    QryShipToDIVISION: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FTPId, FShipToId:Real;
  public
    { Public declarations }
  end;

procedure DoQuickAddTPShipTo(AShipToId, ATPId:Real);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils;
{$R *.dfm}


procedure DoQuickAddTPShipTo(AShipToId, ATPId:Real);
var
  frm: TFrmTPShipTo;
begin
  frm := TFrmTPShipTo.Create(uniGUIApplication.UniApplication);
  frm.FTPId     := ATPId;
  frm.FShipToId := AShipToId;
  frm.ShowModal;
end;

procedure TFrmTPShipTo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, PnlShipToLeft01]);
end;

procedure TFrmTPShipTo.UniFormShow(Sender: TObject);
begin
  QryShipTo.Close;
  QryShipTo.ParamByName('AId').Value := FShipToId;
  QryShipTo.Open;
end;

procedure TFrmTPShipTo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlShipToLeft01]);
end;

procedure TFrmTPShipTo.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTPShipTo.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmTPShipTo.BtnSelectClick(Sender: TObject);
var
  AModalResult: TModalResult;
  AId, AId2:Real;
  ATPIsaCode:String;
begin
  if RTrim(Edit1.Text) = '' then
  begin
    AModalResult := IQConfirmEx('No Ship To Id Code entered - Click OK to continue with no Id Code.', [mbOk, mbCancel]);
    if AModalResult = mrOk then
    begin
//      ATPIsaCode := SelectValueFmtAsString('select e.tp_interchange_code from edi_partners e, ' +
//                                 ' edi_partners_ship_to s where s.ship_to_id = %f and s.id_code is null ' +
//                                 ' and s.edi_partners_id = e.id and e.id = %f', [FShipToId, FTPId]);

      AId2 := SelectValueFmtAsFloat('select e.id from edi_partners e, ' +
                                 ' edi_partners_ship_to s where s.ship_to_id = %f and s.id_code is null ' +
                                 ' and s.edi_partners_id = e.id and e.id = %f', [FShipToId, FTPId]);


      if AId2 <> 0 then
      begin
        ATPIsaCode := SelectValueFmtAsString('select tp_interchange_code from edi_partners where id = %f', [AId2]);
        if ATPIsaCode <> '' then
          raise exception.Create(Format('This Ship To already exists for <Trading Partner: %s> with blank ID Code', [RTrim(ATPIsaCode)]))
        else
          raise exception.Create('This Ship To already exists for Trading Partner with NO ISA ID CODE ASSIGNED with blank ID Code');
      end;

      ExecuteCommandFmt('insert into edi_partners_ship_to (edi_partners_id, ship_to_id) values (%f, %f)', [FTPId, FShipToId]);
      Close;
    end;
  end
  else
  begin
    ATPIsaCode := SelectValueFmtAsString('select e.tp_interchange_code from edi_partners e, ' +
                               ' edi_partners_ship_to s where s.ship_to_id = %f and s.id_code = ''%s'' ' +
                               ' and s.edi_partners_id = e.id and e.id = %f', [FShipToId, RTrim(Edit1.Text), FTPId]);

    if ATPIsaCode <> '' then
      raise exception.Create(Format('This Ship To already exists for <Trading Partner: %s> with ID Code <%s>', [RTrim(ATPIsaCode), RTrim(Edit1.Text)]));

    ExecuteCommandFmt('insert into edi_partners_ship_to (edi_partners_id, ship_to_id, id_code) values (%f, %f, ''%s'')', [FTPId, FShipToId, RTrim(Edit1.Text)]);
    Close;
  end;
end;

end.
