unit bom_clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
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
  uniCheckBox,
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
  TFrmBom_Clone = class(TUniForm)
    PnlButtonCarrier: TUniPanel;
    Bevel1: TUniPanel;
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label5: TUniLabel;
    PnlClient01: TUniPanel;
    edNewMfgNo: TUniEdit;
    chkIncludeUDForm: TUniCheckBox;
    QryInternalDocsBlob: TFDQuery;
    QryInternalDocsBlobSRC_DOCS_ID: TBCDField;
    QryInternalDocsBlobSRC_DOC_BLOB: TBlobField;
    QryInternalDocsBlobTRG_DOCS_ID: TBCDField;
    QryInternalDocsBlobTRG_DOC_BLOB: TBlobField;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    chkCloneAllMfgItems: TUniCheckBox;
    chkReuseProcesses: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure chkReuseProcessesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOld_Standard_ID: Real;
    procedure AssignVars;
    procedure Validate;
    procedure CloneBOM;
    procedure UpdateInternalDocsBLOB( ASrc_Standard_ID, ATrg_Standard_ID: Real );
    procedure CloneDeep;
    procedure CloneShallow;
    procedure OnCheckBoxClickExtraProcessing(Sender: TObject);
  public
    { Public declarations }
    FNew_Standard_ID: Real;
    class function DoShowModal( AOld_Standard_ID: Real; var ANew_Standard_ID: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Boolean,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  IQMS.Common.UserFields,
  IQMS.Common.Usr_Flds,
  IQMS.Common.DataConst;

{ TFrmBom_Clone }

class function TFrmBom_Clone.DoShowModal(  AOld_Standard_ID: Real; var ANew_Standard_ID: Real): Boolean;
var
  Frm  : TFrmBom_Clone;
begin
  Frm := TFrmBom_Clone.Create(uniGUIApplication.UniApplication);
  Frm.FOld_Standard_ID:= AOld_Standard_ID;
  Frm.Caption:= Format('Clone Mfg # %s', [ SelectValueByID('mfgno', 'standard',AOld_Standard_ID)]);
  Frm.chkIncludeUDForm.Caption:= 'Include ' + DefaultToString(GetUD_MenuCaption('STANDARD'), 'User Defined Form Information');
  IQSetTablesActive( TRUE, Frm );
  Frm.AssignVars;
//  IQRegFormRead( FrmBom_Clone, [ FrmBom_Clone,
//                                 FrmBom_Clone.PnlLeft01,
//                                 FrmBom_Clone.chkIncludeUDForm,
//                                 FrmBom_Clone.chkIncludeInternalDocs,
//                                 FrmBom_Clone.chkIncludeExternalDocs,
//                                 FrmBom_Clone.chkCloneAllMfgItems ]);
 Frm.chkCloneAllMfgItems.Visible:= IQMS.Common.MfgShare.Lookup_MfgType( SelectValueByID('mfg_type', 'standard', AOld_Standard_ID)) = 'COMPLEX'; // IQMS.Common.MfgShare.IsUsingMfgType('COMPLEX');



  Result := Frm.ShowModal = mrOk;
  if Result then
     ANew_Standard_ID:= Frm.FNew_Standard_ID;
end;


procedure TFrmBom_Clone.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //IQRegFormWrite( self, [ self, PnlLeft01, chkIncludeUDForm, chkIncludeInternalDocs, chkIncludeExternalDocs, chkCloneAllMfgItems ]);
end;

procedure TFrmBom_Clone.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf(self); //IQSecIns.pas
end;

procedure TFrmBom_Clone.AssignVars;
begin
  if SelectValueAsString('select enable_bom_num_gen from iqsys') = 'Y' then
     edNewMfgNo.Text:= FloatToStr( GetNextSequenceNumber( 'S_BOM' ));
end;

procedure TFrmBom_Clone.btnOKClick(Sender: TObject);
begin
  Validate;
  CloneBOM;
  ModalResult:= mrOK;
end;

procedure TFrmBom_Clone.chkReuseProcessesClick(Sender: TObject);
begin
  OnCheckBoxClickExtraProcessing(Sender);
end;

procedure TFrmBom_Clone.OnCheckBoxClickExtraProcessing(Sender: TObject);
begin
  chkReuseProcesses.OnClick:= nil;
  chkCloneAllMfgItems.OnClick:= nil;
  try
    chkReuseProcesses.Checked  := Sender = chkReuseProcesses;
    chkCloneAllMfgItems.Checked:= Sender = chkCloneAllMfgItems;
  finally
    chkReuseProcesses.OnClick  := chkReuseProcessesClick;
    chkCloneAllMfgItems.OnClick:= chkReuseProcessesClick;
  end;
end;


procedure TFrmBom_Clone.Validate;
begin
  IQAssert( edNewMfgNo.Text > '', 'MFG # must be entered.' );
end;

procedure TFrmBom_Clone.CloneBOM;
begin
  if chkCloneAllMfgItems.Visible and chkCloneAllMfgItems.Checked then
     CloneDeep
  else
     CloneShallow;
end;


procedure TFrmBom_Clone.CloneDeep;
begin
  FNew_Standard_ID:= GetNextID( 'STANDARD' );

  // note we do not insert into standard - jus calling backend proc
  ExecuteCommandFmt('begin bom_route_complex.clone_bom_shell( %f, %f, ''%s'', ''%s'', ''%s'', ''%s'' ); end;',
            [ FOld_Standard_ID,
              FNew_Standard_ID,
              FixStr(edNewMfgNo.Text),
              BoolToYN( chkIncludeUDForm.Checked ),
              BoolToYN( chkIncludeInternalDocs.Checked ),
              BoolToYN( chkIncludeExternalDocs.Checked )]);
end;


procedure TFrmBom_Clone.CloneShallow;
var
  ADBase : TFDConnection;
begin
  ADBase := FDManager.FindConnection(cnstFDConnectionName) as TFDConnection;  // IQMS.Common.DataConst
  ADBase.StartTransaction;
  try
     FNew_Standard_ID:= GetNextID( 'STANDARD' );
     ExecuteCommandFmt('insert into standard (id, mfgno) values (%f, ''%s'')',
     [FNew_Standard_ID, FixStr(edNewMfgNo.Text)]);

     ExecuteCommandFmt('begin bom_clone_standard ( %f, %f, ''%s'', ''%s'', ''%s'', ''%s'' ); end;',
               [ FOld_Standard_ID,
                 FNew_Standard_ID,
                 BoolToYN( chkIncludeUDForm.Checked ),
                 BoolToYN( chkIncludeInternalDocs.Checked ),
                 BoolToYN( chkIncludeExternalDocs.Checked ),
                 BoolToYN( chkReuseProcesses.Checked )]);

     UpdateInternalDocsBLOB( FOld_Standard_ID, FNew_Standard_ID );

     ADBase.Commit;
  finally
     if ADBase.InTransaction then ADBase.RollBack;
  end;
end;


procedure TFrmBom_Clone.UpdateInternalDocsBLOB(ASrc_Standard_ID,  ATrg_Standard_ID: Real);
var
  ASource      : TFDTable;
  ATarget      : TFDTable;
  ABitmap      : TBitMap;
  SrcBlobStream: TFDBlobStream;
  TrgBlobStream: TFDBlobStream;
begin
  {for some reason I couldnt use TFDQuery to read blob field properly - had to switch to TTable}
  ASource:= TFDTable.Create(self);
  ATarget:= TFDTable.Create(self);
  try
    ASource.ConnectionName := cnstFDConnectionName;;
    ATarget.ConnectionName := cnstFDConnectionName;;

    ASource.TableName:= 'IQ_DOCS';
    ATarget.TableName:= 'IQ_DOCS';

    with QryInternalDocsBlob do
    begin
      Close;
      ParamByName('src_standard_id').Value := ASrc_Standard_ID;
      ParamByName('trg_standard_id').Value := ATrg_Standard_ID;
      Open;
      while not Eof do
      begin
        if FieldByName('trg_doc_blob').IsNull then
        begin
          ASource.Open;
          ATarget.Open;

          if ATarget.Locate('id', FieldByName('trg_docs_id').asFloat, []) and
             ASource.Locate('id', FieldByName('src_docs_id').asFloat, []) then
          begin
             ATarget.Edit;
             ATarget.FieldByName('doc_blob').Assign( ASource.FieldByName('doc_blob'));
             ATarget.Post;
          end;
        end;

        Next;
      end;
    end;
  finally
    ASource.Free;
    ATarget.Free;
  end;
end;

end.


