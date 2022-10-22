unit OeClone;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmCloneSalesOrder = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnClone: TUniButton;
    btnCancel: TUniButton;
    edOrderno: TUniEdit;
    Label11: TUniLabel;
    cbCloneReleases: TUniCheckBox;
    cbCloneInternal: TUniCheckBox;
    cbCloneExternal: TUniCheckBox;
    cbCloneEmail: TUniCheckBox;
    cbUseCurrentTerms: TUniCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloneClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrdersId:Real;
    FId:Real;
    FCloned:boolean;
  public
    { Public declarations }
  end;

function CloneOE(AId:Real):Real;

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  oe_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence;

{$R *.dfm}

function CloneOE(AId:Real):Real;
var
  frm: TFrmCloneSalesOrder;
begin
  frm := TFrmCloneSalesOrder.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    FOrdersId:= Aid;
    ShowModal;
    if not FCloned then
      Result := 0
    else
      Result := FId;
  end;
end;

procedure TFrmCloneSalesOrder.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  FCloned := false;
end;

procedure TFrmCloneSalesOrder.UniFormShow(Sender: TObject);
var
  S: string;
  AEPlant_ID: string;
begin
  FId := GetNextID('ORDERS');

  AEPlant_ID:= SecurityManager.EPlant_ID;
  if AEPlant_ID <> 'NULL' then
     S:= GetEPlantNextSequenceNumber( AEPlant_ID, 'SO', 'S_ORDERS' )
  else
  begin
    S := Format('%d', [Trunc(FId)]);
    IQAppend_EPlant_Suffix( AEPlant_ID, S );
  end;

  edOrderno.text := S;

end;

procedure TFrmCloneSalesOrder.btnCancelClick(Sender: TObject);
begin
  FId := 0;
  Close;
end;

procedure TFrmCloneSalesOrder.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCloneSalesOrder.btnCloneClick(Sender: TObject);
begin
  if edOrderno.text = '' then
    raise Exception.Create(oe_rscstr.cTXT0000110);

  ExecuteCommandFmt('begin oe_clone.CloneSO(%f, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %f); end;',
            [FOrdersId,
             edOrderno.text,
             IQMS.Common.Numbers.sIIf(cbCloneReleases.Checked,   'Y', 'N'),
             IQMS.Common.Numbers.sIIf(cbCloneInternal.Checked,   'Y', 'N'),
             IQMS.Common.Numbers.sIIf(cbCloneExternal.Checked,   'Y', 'N'),
             IQMS.Common.Numbers.sIIf(cbCloneEmail.Checked,      'Y', 'N'),
             IQMS.Common.Numbers.sIIf(cbUseCurrentTerms.Checked, 'Y', 'N'),
             FId]);

  FCloned := true;

  IQInformation(oe_rscstr.cTXT0000111);
  Close;
end;

end.
