unit TaTaskMsg;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Db,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  IQMS.Common.DataConst, // cnstFDConnectionName
  uniTimer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmTaskMsg = class(TUniForm)
    Panel3: TUniPanel;
    btnYes: TUniBitBtn;
    Memo1: TUniMemo;
    Timer1: TUniTimer;
    procedure btnYesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FShow: Boolean;
  public
    { Public declarations }
  end;

procedure DoTaTaskMsg(AType, AId: String);

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

{$R *.DFM}

procedure DoTaTaskMsg(AType, AId: String);
var
  frm: TFrmTaskMsg;
  ASourceId: String;
  AInt: Real;
  Qry: TFDQuery;
begin
  frm := TFrmTaskMsg.Create(uniGUIApplication.UniApplication);
  ASourceId := AId;

  if AType = 'WO' then
    ASourceId := SelectValueFmtAsString('select standard_id from workorder where id = %s', [ASourceId]);

  Qry := TFDQuery.Create(nil);
  try
    Qry.ConnectionName := cnstFDConnectionName;
    Qry.Sql.Add(Format('select ta_message from ta_messages where source = ''%s'' and source_id = %s ' + ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate', [AType, ASourceId]));
    Qry.Open;
    while not Qry.Eof do
    begin
      frm.Memo1.Lines.Add(Qry.FieldByName('ta_message').asString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;

  frm.FShow := frm.Memo1.Lines.Count <> 0;
  AInt := SelectValueFmtAsFloat('select max(display_time) from ta_messages where source = ''%s'' and source_id = %s ' + ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate', [AType, ASourceId]);
  if AInt <> 0 then
    frm.Timer1.Interval := Trunc(AInt) * 1000
  else
    frm.Timer1.Interval := 20000;

  if frm.FShow then
  begin
    frm.Timer1.Enabled := True;
    frm.ShowModal;
  end;

end;

procedure TFrmTaskMsg.UniFormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  FShow := False;
  IQRegFormRead(self, [self]);
end;

procedure TFrmTaskMsg.UniFormShow(Sender: TObject);
begin
  Visible := FShow;
end;

procedure TFrmTaskMsg.btnYesClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaskMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmTaskMsg.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

end.
