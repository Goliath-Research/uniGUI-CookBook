unit SelSales;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  MainSale,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, Vcl.Controls,
  uniGUIFrame;

type
  TFrmSelSalesPerson = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcSel: TDataSource;
    QrySel: TFDQuery;
    QrySelID: TBCDField;
    QrySelSALES_CODE: TStringField;
    QrySelFIRST_NAME: TStringField;
    QrySelLAST_NAME: TStringField;
    SBSave: TUniSpeedButton;
    sbAssignAmounts: TUniSpeedButton;
    PostCommissions1: TUniMenuItem;
    AssignAmountstopay1: TUniMenuItem;
    procedure sbAssignAmountsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBSaveClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ProcessSelectedSalesPeople;

implementation
uses
  IQMS.Common.DataLib,
  sal_rscstr,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.PanelMsg;
{$R *.dfm}


procedure ProcessSelectedSalesPeople;
var
  LFrmSelSalesPerson : TFrmSelSalesPerson;
begin
  LFrmSelSalesPerson := TFrmSelSalesPerson.Create(UniGUIApplication.UniApplication);
  LFrmSelSalesPerson.Show;
end;

procedure TFrmSelSalesPerson.sbAssignAmountsClick(Sender: TObject);
var
  I:Integer;
  AProcessClosed:String;
  hMsg: TPanelMesg;
  APaidInFull:String;
begin
{ TODO : TIQUniGridControl has noproperty SelectedList }
  {if IqSearch1.wwDbGrid.SelectedList.Count = 0 then
    raise Exception.Create(sal_rscstr.cTXT0000005); // 'No records selected'     }
  try
     hMsg := hPleaseWait(sal_rscstr.cTXT0000043); // panelmsg

    if TFrmSalesPeople(self.Owner).Paysalespersonwhenpaidinfullfromcustomer1.Checked then
      APaidInFull := 'Y'
    else
      APaidInFull := 'N';

    { TODO : TIQUniGridControl has no method wwDbGrid }
   (* with IqSearch1.wwDbGrid, IqSearch1.wwDbGrid.datasource.dataset do
      for i:= 0 to SelectedList.Count - 1 do
      begin
        GotoBookmark(SelectedList.items[i]);

        if TFrmSalesPeople(self.Owner).HideClosedCommissions1.Checked then
          AProcessClosed := 'N'
        else
          AProcessClosed := 'Y';

        if TFrmSalesPeople(self.Owner).Onelineperinvoice1.checked then
        begin
          ExecuteCommandFmt('begin comissions.CalculateAllOneLinePerInv(%f, ''%s'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), ''%s''); end;',
                    [QrySelID.asFloat,
                     AProcessClosed,
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).StartDate),
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).FinishDate),
                     APaidInFull])
        end
        else
        begin
          ExecuteCommandFmt('begin comissions.CalculateAll(%f, ''%s'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), ''%s''); end;',
                    [QrySelID.asFloat,
                     AProcessClosed,
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).StartDate),
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).FinishDate),
                     APaidInFull]);
        end;
      end;          *)


  finally
    hMsg.free;
  end;
    IqConfirm(sal_rscstr.cTXT0000045);
end;

procedure TFrmSelSalesPerson.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self]);
end;

procedure TFrmSelSalesPerson.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmSelSalesPerson.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelSalesPerson.SBSaveClick(Sender: TObject);
var
  I:Integer;
  AProcessClosed, APaysalesperson, AUseaccruedcomm:String;
  hMsg: TPanelMesg;
begin
  { TODO : TIQUniGridControl has noproperty SelectedList }
  {if IqSearch1.wwDbGrid.SelectedList.Count = 0 then
    raise Exception.Create(sal_rscstr.cTXT0000005); // 'No records selected' }

  if TFrmSalesPeople(self.Owner).HideClosedCommissions1.Checked then
    AProcessClosed := 'N'
  else
    AProcessClosed := 'Y';

  if TFrmSalesPeople(self.Owner).Paysalespersonwhenpaidinfullfromcustomer1.Checked then
    APaysalesperson := 'Y'
  else
    APaysalesperson := 'N';

  if TFrmSalesPeople(self.Owner).Useaccruedcommissionswhenposting1.Checked then
    AUseaccruedcomm := 'Y'
   else
    AUseaccruedcomm := 'N';
  try
    hMsg := hPleaseWait(sal_rscstr.cTXT0000043); // panelmsg
    { TODO : TIQUniGridControl has no method wwDBGrid }
    (*with IqSearch1.wwDbGrid, IqSearch1.wwDbGrid.datasource.dataset do
      for i:= 0 to SelectedList.Count - 1 do
      begin
        GotoBookmark(SelectedList.items[i]);

        if TFrmSalesPeople(self.Owner).Onelineperinvoice1.checked then
        begin
          ExecuteCommandFmt('begin comissions.PostSalesPersonOneInv(%f, ''%s'', ''%s'', ''%s'', ''N'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR'')); end;',
                    [QrySelID.asFloat,
                     AProcessClosed,
                     APaysalesperson,
                     AUseaccruedcomm,
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).StartDate),
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).FinishDate)])
        end
        else
        begin
          ExecuteCommandFmt('begin comissions.PostSalesPersonAll(%f, ''%s'', ''%s'', ''%s'', ''Y'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR'')); end;',
                    [QrySelID.asFloat,
                     AProcessClosed,
                     APaysalesperson,
                     AUseaccruedcomm,
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).StartDate),
                     FormatDateTime('mm/dd/yyyy', TFrmSalesPeople(self.Owner).FinishDate)]);
        end;
      end;        *)

  finally
    hMsg.Free;
  end;
  IqConfirm(sal_rscstr.cTXT0000046);
end;

procedure TFrmSelSalesPerson.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self]);
  { TODO : TIQUniGridControl has no method wwDBGrid }
  //IqSearch1.wwDbGrid.UnSelectAll;
  QrySel.Open;
end;

end.
