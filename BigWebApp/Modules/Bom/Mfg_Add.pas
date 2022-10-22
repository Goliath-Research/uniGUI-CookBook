unit Mfg_Add;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl;

type
  TFrmMfg_Add = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    Label13: TUniLabel;
    edUDMfgType: TUniEdit;
    wwDBComboBoxDefaultTo: TUniComboBox;
    Label2: TUniLabel;
    wwDBComboBoxPredefined: TUniComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Validate;
    procedure LoadPredefinedMfgTypes( AList: TStrings );
  public
    { Public declarations }
    class function DoShowModal(var AMfgType, AMfgType_Standard: string ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare;

class function TFrmMfg_Add.DoShowModal(var AMfgType, AMfgType_Standard: string ): Boolean;
var
  LFrmMfg_Add : TFrmMfg_Add;
begin
  AMfgType_Standard:= '';
  LFrmMfg_Add := TFrmMfg_Add.Create( uniGUIApplication.UniApplication );
  Result:= LFrmMfg_Add.ShowModal = mrOK;
  if Result then
    case LFrmMfg_Add.PageControl1.ActivePageIndex of
      0 {predefined }:
        begin
          AMfgType:= LFrmMfg_Add.wwDBComboBoxPredefined.Items[ LFrmMfg_Add.wwDBComboBoxPredefined.ItemIndex ];
        end;

      1 {userdefined}:
        begin
          AMfgType:= FixStr(Trim(UpperCase(LFrmMfg_Add.edUDMfgType.Text)));
          if LFrmMfg_Add.wwDBComboBoxDefaultTo.ItemIndex > -1 then
             AMfgType_Standard:= LFrmMfg_Add.wwDBComboBoxDefaultTo.Items[ LFrmMfg_Add.wwDBComboBoxDefaultTo.ItemIndex ];
        end;
    end;
end;

procedure TFrmMfg_Add.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmMfg_Add.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmMfg_Add.Validate;
begin
  case PageControl1.ActivePageIndex of
    0: begin
         IQAssert( wwDBComboBoxPredefined.ItemIndex > -1, 'Mfg Type not selected - opertaion aborted');
       end;
    1: begin
         IQAssert( Trim(edUDMfgType.Text) > '', 'User Defined Mfg Type must be specified - operation aborted.' );
         IQAssert( Length(edUDMfgType.Text) <= 10, 'User Defined Mfg Type cannot exceed 10 chars.' );
         IQAssert( Pos('''', edUDMfgType.Text) = 0, 'User Defined Mfg Type cannot contain an apostrophe.' );
         IQAssert( Pos('"', edUDMfgType.Text) = 0, 'User Defined Mfg Type cannot contain an apostrophe.' );
         IQAssert( not IsPredefinedMfgType( UpperCase(Trim(edUDMfgType.Text))), 'This is a standard mfg type and is not available to utilize in a User Defined mfg type');
       end;
  end;
end;

procedure TFrmMfg_Add.LoadPredefinedMfgTypes(AList: TStrings);
var
  I: Integer;
begin
  AList.Clear;
  for I:= 0 to High(IQMS.Common.MfgShare.IQPredefinedMfgType) do
    AList.Add( IQPredefinedMfgType[ I ] );
  TStringList(AList).Sort;
end;


procedure TFrmMfg_Add.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmMfg_Add.UniFormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;

  LoadPredefinedMfgTypes( wwDBComboBoxPredefined.Items );
  LoadPredefinedMfgTypes( wwDBComboBoxDefaultTo.Items );
end;

end.
