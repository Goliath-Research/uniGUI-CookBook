unit RevControl;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Mask,
  IQMS.WebVcl.UDComboBox,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox;

type
  TFrmRevControl = class(TUniForm)
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    dbeComment1: TIQWebUDComboBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Memo1: TUniMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnYesClick(Sender: TObject);
    procedure BtnNoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrdersId:Real;
    FResult:boolean;
    procedure SetOrdersId(const Value: Real);
  public
    { Public declarations }
    property OrdersId : Real write SetOrdersId;
  end;

procedure DoRevControl(AOrdersId:Real);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{$R *.dfm}


procedure DoRevControl(AOrdersId:Real);
var
  LFrmRevControl : TFrmRevControl;
begin
  if SelectValueAsString('select NVL(enable_rev_hist, ''N'') from iqsys2 where rownum < 2') = 'N' then
  begin
    ExecuteCommandFmt( 'update orders set rev = NVL(rev,0) + 1 where id = %f', [ AOrdersId ]);
    exit;
  end;
  LFrmRevControl := TFrmRevControl.Create(UniGUIApplication.UniApplication);
  with LFrmRevControl do
  begin
    OrdersId := AOrdersId;
    ShowModal;
  end;
end;

procedure TFrmRevControl.BtnNoClick(Sender: TObject);
begin
  FResult := false;
  Close;
end;

procedure TFrmRevControl.BtnYesClick(Sender: TObject);
begin
  ExecuteCommandFmt('insert into ORD_REV_HISTORY (orders_id, old_rev, new_rev, date_change, note, userid, comment1) ' +
            ' select id, rev, NVL(rev, 0) + 1, sysdate, ''%s'', misc.getusername, ''%s'' from orders where id = %f',
            [StrTran(Memo1.text, '''', ''''''),  StrTran(dbeComment1.text, '''', ''''''), FOrdersId]);

  FResult := true;
  Close;
end;

procedure TFrmRevControl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if not FResult then
  ExecuteCommandFmt( 'update orders set rev = NVL(rev,0) + 1 where id = %f', [ FOrdersId ]);
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmRevControl.SetOrdersId(const Value: Real);
begin
  FOrdersId := Value;
end;

procedure TFrmRevControl.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  FResult := false;
end;

end.
