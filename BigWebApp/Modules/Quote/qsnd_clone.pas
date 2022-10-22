unit qsnd_clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  snd_clone,
  uniGUIApplication, //UniApplication
  MainModule, uniCheckBox, uniButton, uniGUIClasses, uniPanel, uniEdit,
  Vcl.Controls, Vcl.Forms, uniGUIBaseClasses, uniLabel;

type
  TFrmQSndClone = class(TFrmSndClone)
  private
    { Private declarations }
  protected
    procedure InitForm; override;
    procedure Validate; override;
    procedure CloneSndop; override;
  public
    { Public declarations }
    class function DoShowModal(ASndop_ID: Real ): Real; reintroduce;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous;

{ TFrmQSndClone }

procedure TFrmQSndClone.CloneSndop;
begin
  ExecuteCommandFmt('begin                               '+
            '  sndop_misc.clone_qsndop( %f,       '+   // v_src_sndop_id number,
            '                           %f,       '+   // v_trg_sndop_id   number,
            '                           ''%s'',   '+   // v_trg_opno       varchar2,
            '                           ''%s'');  '+   // v_trg_desc
            'end;                                ',
            [ FExistSndop_ID,
              FNewSndop_ID,
              FixStr(edNewOperNo.Text),
              FixStr(edNewDesc.Text)]);
end;

class function TFrmQSndClone.DoShowModal(ASndop_ID: Real): Real;
var
  frm : TFrmQSndClone;
begin
  frm:= TFrmQSndClone.Create(UniGUIApplication.UniApplication);
  frm.ExistSndID:= ASndop_ID;

  if frm.ShowModal = mrOK then
     Result:= frm.FNewSndop_ID;

end;

procedure TFrmQSndClone.InitForm;
begin
  edExistOperNo.Text:= SelectValueByID('opno', 'qsndop', FExistSndop_ID);
  FNewSndop_ID:= GetNextID('qsndop');
end;

procedure TFrmQSndClone.Validate;
begin
  IQAssert( Trim(edNewOperNo.Text) > '', 'Operation # must be entered - unable to continue.' );
  IQAssert( SelectValueFmtAsFloat('select 1 from qsndop where opno = ''%s''', [ FixStr(Trim(edNewOperNo.Text)) ]) = 0, 'Operation # must be unique - unable to continue.' );
end;

end.
