unit crm_soconfig_check;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  System.ImageList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniTreeView,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniImage;

type
  TFrmCheckOptionItems = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOk: TUniBitBtn;
    SrcTemplatesQuoted: TDataSource;
    QryTemplatesQuoted: TFDQuery;
    QryTemplatesQuotedID: TBCDField;
    QryTemplatesQuotedDESCRIP: TStringField;
    QryTemplatesQuotedUNIT_PRICE: TFMTBCDField;
    QryTemplatesQuotedARINVT_ITEMNO: TStringField;
    QryTemplatesQuotedARINVT_DESCRIP: TStringField;
    QryTemplatesQuotedSALES_CONFIG_ID: TBCDField;
    QryTemplatesQuotedCRM_QUOTE_ID: TBCDField;
    SrcTemplateItems: TDataSource;
    QryTemplateItems: TFDQuery;
    QryTemplateItemsSOURCE: TStringField;
    QryTemplateItemsSOURCE_ID: TBCDField;
    QryTemplateItemsSOURCE_DISPLAY: TStringField;
    QryTemplateItemsSALES_CONFIG_ID: TBCDField;
    QryTemplateItemsSALES_CONFIG_OPTION_ID: TBCDField;
    QryTemplateItemsSALES_OPTION_CHOICE_ID: TBCDField;
    QryTemplateItemsID: TBCDField;
    QryTemplateItemsUNIT_PRICE: TFMTBCDField;
    QryTemplateItemsQTY: TBCDField;
    QryTemplateItemsOPTIONAL: TStringField;
    tvSC: TUniTreeView;
    ImageList1: TUniImageList;
    SR: TIQWebSecurityRegister;
    Panel5: TUniPanel;
    PnlLeft: TUniPanel;
    imgError: TUniImage;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    procedure FormShow(Sender: TObject);
    procedure QryTemplatesQuotedBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCRMQuoteID: Real;
    FHasItems: Boolean;
    procedure BuildTree;
    procedure SetCRMQuoteID(const Value: Real);
  public
    { Public declarations }
    property CRMQuoteID: Real write SetCRMQuoteID;
  end;

  function CheckOptionSalesConfigItems(ACRMQuoteID: Real): Boolean;



implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //iqsecins,
  IQMS.Common.DataLib;

function CheckOptionSalesConfigItems(ACRMQuoteID: Real): Boolean;
var
  FrmCheckOptionItems: TFrmCheckOptionItems;
begin
  FrmCheckOptionItems := TFrmCheckOptionItems.Create(uniGUIApplication.UniApplication);
  with FrmCheckOptionItems do
  begin
    try
      FCRMQuoteID := ACRMQuoteID;
      if not FHasItems then Result := TRUE
      else Result := ShowModal = mrOk;
    finally
      //Free;
    end;
  end;
end;

{ TFrmCheckOptionItems }


procedure TFrmCheckOptionItems.UniFormCreate(Sender: TObject);
begin
  BuildTree;
end;

procedure TFrmCheckOptionItems.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on IQsecins}
  //EnsureSecurityInspectorOnTopOf(Self); // iqsecins
end;

procedure TFrmCheckOptionItems.QryTemplatesQuotedBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCRMQuoteID);
end;

procedure TFrmCheckOptionItems.SetCRMQuoteID(const Value: Real);
begin
  FCRMQuoteID := Value;
end;

procedure TFrmCheckOptionItems.BuildTree;
var
  ANode, ATemp: TUniTreeNode;
begin
  try
     tvSC.Items.BeginUpdate;
     tvSC.Items.Clear;
     ANode := NIL;
     ReOpen(QryTemplatesQuoted);
     ReOpen(QryTemplateItems);
     QryTemplatesQuoted.First;
     while not QryTemplatesQuoted.Eof do
      begin
        QryTemplateItems.First;
        ANode := tvSC.Items.Add(NIL, QryTemplatesQuotedDESCRIP.AsString);
        ANode.ImageIndex := 0;
        ANode.SelectedIndex := 1;

        while not QryTemplateItems.Eof do
         begin
           ATemp := tvSC.Items.AddChild(ANode, QryTemplateItemsSOURCE_DISPLAY.AsString);
           ATemp.ImageIndex := 2;
           ATemp.SelectedIndex := 2;
           QryTemplateItems.Next;
         end;

        // Remove the empty node
        if (QryTemplateItems.Bof and QryTemplateItems.Eof) then
           tvSC.Items.Delete(ANode);

        QryTemplatesQuoted.Next;
      end;
     FHasItems := (tvSC.Items.Count > 0);
     tvSC.FullExpand;
     { TODO -oSanketG -cWebConvert :Need to find alternative for TopItem in TUniTreeView  }
     //tvSC.Selected := tvSC.TopItem;
  finally
     if QryTemplateItems.Active then QryTemplateItems.Close;
     if QryTemplatesQuoted.Active then QryTemplatesQuoted.Close;
     tvSC.Items.EndUpdate;
  end;

end;

end.
