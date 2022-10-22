unit fr_clone;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmForecastClone = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel4: TUniPanel;
    edName: TUniEdit;
    edDescrip: TUniEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSrcFore_Head_ID: Real;
    FTrgFore_Head_ID: Real;
    procedure SetSrcFore_Head_ID(const Value: Real);
    procedure SetTrgFore_Head_ID(const Value: Real);
  public
    { Public declarations }
    //TrgFore_Head_ID: Real;
    class function DoShowModal(ASrcFore_Head_ID: Real; var ATrgFore_Head_ID: Real ): Boolean;
    property SrcFore_Head_ID: Real write SetSrcFore_Head_ID;
    property TrgFore_Head_ID: Real write SetTrgFore_Head_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

class function TFrmForecastClone.DoShowModal(ASrcFore_Head_ID: Real; var ATrgFore_Head_ID: Real ): Boolean;
var
  FrmForecastClone : TFrmForecastClone;
begin
  FrmForecastClone := TFrmForecastClone.Create( uniGUIApplication.uniApplication );
  FrmForecastClone.SrcFore_Head_ID := ASrcFore_Head_ID;
  Result:= FrmForecastClone.ShowModal = mrOK;
  if Result then
    ATrgFore_Head_ID:= FrmForecastClone.FTrgFore_Head_ID;
end;

procedure TFrmForecastClone.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ])
end;


procedure TFrmForecastClone.SetSrcFore_Head_ID(const Value: Real);
begin
  FSrcFore_Head_ID := Value;
end;

procedure TFrmForecastClone.SetTrgFore_Head_ID(const Value: Real);
begin
  FTrgFore_Head_ID := Value;
end;

procedure TFrmForecastClone.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  Caption:= Format('Clone Forecast [ID = %.0f]', [ FSrcFore_Head_ID ]);
  edName.maxlength:=30;
  edDescrip.maxlength:=100;
end;

procedure TFrmForecastClone.btnOKClick(Sender: TObject);
begin
  IQAssert( Trim(edName.Text) > '', 'Forecast Name must be entered - operation aborted');
  IQAssert( Trim(edDescrip.Text) > '', 'Forecast Description must be entered - operation aborted');

  TrgFore_Head_ID:= GetNextID('fore_head');
  ExecuteCommandFmt('declare                                       '+
            '  v_src_fore_head_id number:= %f;             '+
            '  v_trg_fore_head_id number:= %f;             '+
            '  v_trg_name         varchar2(30):= ''%s'';   '+
            '  v_trg_descrip      varchar2(100):= ''%s'';  '+
            'begin                                         '+
            '  forecast_hist.do_clone( v_src_fore_head_id, '+
            '                          v_trg_fore_head_id, '+
            '                          v_trg_name,         '+
            '                          v_trg_descrip );    '+
            'end;                                          ',
            [ FSrcFore_Head_ID,
              FTrgFore_Head_ID,
              FixStr(Trim(edName.Text)),
              FixStr(Trim(edDescrip.Text))]);

  ModalResult:= mrOK;
end;

end.
