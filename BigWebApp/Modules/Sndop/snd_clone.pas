unit snd_clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  MainModule,
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
  TFrmSndClone = class(TUniForm)
    Label1: TUniLabel;
    edExistOperNo: TUniEdit;
    Label2: TUniLabel;
    edNewOperNo: TUniEdit;
    Label3: TUniLabel;
    edNewDesc: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    pnlOptions: TUniPanel;
    chkWorkCenters: TUniCheckBox;
    chkCertified: TUniCheckBox;
    chkInspections: TUniCheckBox;
    chkMaterials: TUniCheckBox;
    chkRejectsCodes: TUniCheckBox;
    chkAuxEquip: TUniCheckBox;
    chkDocuments: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  protected
    FExistSndop_ID: Real;
    FNewSndop_ID: Real;
    procedure InitForm; virtual;
    procedure Validate; virtual;
    procedure CloneSndop; virtual;
  public
    { Public declarations }
    class function DoShowModal(ASndop_ID: Real ): Real;
    property ExistSndID : Real write FExistSndop_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;

{ TFrmSndClone }

class function TFrmSndClone.DoShowModal(ASndop_ID: Real): Real;
var
  aFrmSndClone : TFrmSndClone;
begin
  aFrmSndClone:= TFrmSndClone.Create(UniGUIApplication.UniApplication);
  aFrmSndClone.ExistSndID:= ASndop_ID;

  if aFrmSndClone.ShowModal = mrOK then
     Result:= aFrmSndClone.FNewSndop_ID;
end;

procedure TFrmSndClone.InitForm;
begin
  edExistOperNo.Text:= SelectValueByID('opno', 'sndop', FExistSndop_ID);
  edNewDesc.Text    := SelectValueByID('opdesc', 'sndop', FExistSndop_ID);

  FNewSndop_ID:= GetNextID('sndop');

  // edNewDesc
  pnlOptions.Visible:= SelectValueByID('op_class', 'sndop', FExistSndop_ID) = 'AS';

  if pnlOptions.Visible then
     self.Constraints.MinHeight:= 315;
end;

procedure TFrmSndClone.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self,
                       chkWorkCenters,
                       chkCertified,
                       chkInspections,
                       chkMaterials,
                       chkRejectsCodes,
                       chkAuxEquip,
                       chkDocuments ]);
end;

procedure TFrmSndClone.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite(self, [self,
                       chkWorkCenters,
                       chkCertified,
                       chkInspections,
                       chkMaterials,
                       chkRejectsCodes,
                       chkAuxEquip,
                       chkDocuments ]);
end;

procedure TFrmSndClone.UniFormShow(Sender: TObject);
begin
  InitForm;
  edNewOperNo.Text:= FloatToStr( FNewSndop_ID );
end;

procedure TFrmSndClone.btnOKClick(Sender: TObject);
begin
  Validate;
  CloneSndop;
  ModalResult:= mrOK;
end;

procedure TFrmSndClone.Validate;
begin
  IQAssert( Trim(edNewOperNo.Text) > '', 'Operation # must be entered - unable to continue.' );
  IQAssert( SelectValueFmtAsFloat('select 1 from sndop where opno = ''%s''', [ FixStr(Trim(edNewOperNo.Text)) ]) = 0, 'Operation # must be unique - unable to continue.' );
end;

procedure TFrmSndClone.CloneSndop;
begin
  ExecuteCommandFmt('begin                               '+
            '  sndop_misc.clone_sndop( %f,       '+   // v_src_sndop_id number,
            '                          %f,       '+   // v_trg_sndop_id   number,
            '                          ''%s'',   '+   // v_trg_opno       varchar2,
            '                          ''%s'',   '+   // v_trg_desc
            '                          ''%s'',   '+   // chkWorkCenters.Checked
            '                          ''%s'',   '+   // chkCertified.Checked
            '                          ''%s'',   '+   // chkInspections.Checked
            '                          ''%s'',   '+   // chkMaterials.Checked
            '                          ''%s'',   '+   // chkRejectsCodes.Checked
            '                          ''%s'',   '+   // chkAuxEquip.Checked
            '                          ''%s'');  '+   // chkDocuments.Checked
            'end;                                ',
            [ FExistSndop_ID,
              FNewSndop_ID,
              FixStr(edNewOperNo.Text),
              FixStr(edNewDesc.Text),
              IQMS.Common.StringUtils.BoolToYN( chkWorkCenters.Checked ),
              IQMS.Common.StringUtils.BoolToYN( chkCertified.Checked   ),
              IQMS.Common.StringUtils.BoolToYN( chkInspections.Checked ),
              IQMS.Common.StringUtils.BoolToYN( chkMaterials.Checked   ),
              IQMS.Common.StringUtils.BoolToYN( chkRejectsCodes.Checked),
              IQMS.Common.StringUtils.BoolToYN( chkAuxEquip.Checked    ),
              IQMS.Common.StringUtils.BoolToYN( chkDocuments.Checked   )]);
end;

end.
