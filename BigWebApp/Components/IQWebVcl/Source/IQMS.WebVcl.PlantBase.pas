unit IQMS.WebVcl.PlantBase;

{ *****************************************************************************
  Inheritance:
  If you make changes to controls in this unit, be sure to verify the
  changes will work in forms that inherit from this form:

    [+] TFrmChangeEPlantBase
        -> TFrmChangeEPlant [CHNGPLNT.pas]
        -> TFrmChangeEPlantTouchScreen [tchscrn_eplant.pas]

  *****************************************************************************}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TFrmChangeEPlantBase = class(TUniForm)
    QryEPlant: TFDQuery;
    QryEPlantCOMPANY_NAME: TStringField;
    QryEPlantPLANT_ID: TBCDField;
    QryEPlantPLANT_NAME: TStringField;
    StatusBar1: TUniStatusBar;
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    rbtnAll: TUniRadioButton;
    rbtnOne: TUniRadioButton;
    wwcombPlant: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    SrcEPlant: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure rbtnAllClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure PnlMainResize(Sender: TObject);

  private
    { Private declarations }
    FEPlant_ID: string;
    procedure DispDefaults;
    function GetIsChanged: Boolean;
    function GetIsViewAll: Boolean;
    function GetIsViewOne: Boolean;
    function GetEPlant_ID: string;
    //procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  protected
    { Protected declarations }
    procedure SetControls; virtual;
  public
    { Public declarations }
    property IsChanged: Boolean read GetIsChanged;
    property IsViewAll: Boolean read GetIsViewAll;
    property IsViewOne: Boolean read GetIsViewOne;
    property EPlant_ID: string  read GetEPlant_ID;

    class function DoChangeEPlantView( var AEPlant_ID: string ): Boolean;

  end;

  function DoPickEPlant( var AEPlant_ID: string ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.ResStrings;


class function TFrmChangeEPlantBase.DoChangeEPlantView( var AEPlant_ID: string ): Boolean;
var
  frm : TFrmChangeEPlantBase;
begin

  frm := TFrmChangeEPlantBase.Create(uniGUIApplication.UniApplication);

  with frm do
     FEPlant_ID:= sIIf( Trim(AEPlant_ID) = '', 'NULL', AEPlant_ID );

  Result := (frm.ShowModal = mrOk) and frm.IsChanged;

  if Result then
     if frm.IsViewAll then
        AEPlant_ID := 'NULL'
     else
        AEPlant_ID := frm.EPlant_ID;
end;

function DoPickEPlant( var AEPlant_ID: string ): Boolean;
var
  frm : TFrmChangeEPlantBase;
begin
  frm := TFrmChangeEPlantBase.Create(uniGUIApplication.UniApplication);

  Result := (frm.ShowModal = mrOk);
  if Result  then
     AEPlant_ID:= sIIf( frm.IsViewAll, 'NULL',  frm.EPlant_ID );
end;

{ TFrmChangeEPlantBase }
procedure TFrmChangeEPlantBase.FormCreate(Sender: TObject);
begin
  QryEPlant.Active:=True;
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
  DispDefaults;

  rbtnAll.Checked:= (FEPlant_ID = 'NULL') and rbtnAll.Visible;
  rbtnOne.Checked:= not rbtnAll.Checked;
  if FEPlant_ID <> 'NULL' then
  begin
     wwcombPlant.Text:= SelectValueFmtAsString( 'select name from eplant where id = %s', [ FEPlant_ID ]);
//     wwcombPlant.PerformSearch;
  end;
  rbtnAllClick( NIL );
end;

procedure TFrmChangeEPlantBase.FormShow(Sender: TObject);
begin
  SetControls;
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmChangeEPlantBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

//procedure TFrmChangeEPlantBase.IQAfterShowMessage(var Msg: TMessage);
//begin
//  self.BringToFront;
//end;

procedure TFrmChangeEPlantBase.DispDefaults;
var
  ID   : string;
  AName: string;
begin
  if (SecurityManager <> nil) then
  with SecurityManager do
    begin
      StatusBar1.Panels[ 0 ].Text:= Format('User: %s', [ UserName ]);
      ID   := GetDefaultUserEPlant_ID;
      AName:= SelectValueFmtAsString( 'select name from eplant where id = %s', [ ID ]);
      if AName = '' then
         StatusBar1.Panels[ 1 ].Text:= IQMS.Common.ResStrings.cTXT0000204 // 'Default: None'
      else
         StatusBar1.Panels[ 1 ].Text:= Format( IQMS.Common.ResStrings.cTXT0000205 {'Default: %s [ %s ]'}, [ AName, ID ]);
    end
  else
    begin
      StatusBar1.Panels[ 0 ].Text:= IQMS.Common.ResStrings.cTXT0000206; // 'User: SecMan N/A'
      StatusBar1.Panels[ 1 ].Text:= IQMS.Common.ResStrings.cTXT0000207; // 'Default: N/A';
    end;
end;

procedure TFrmChangeEPlantBase.rbtnAllClick(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmChangeEPlantBase.SetControls;
begin
  IQEnableControl( wwcombPlant, rbtnOne.Checked );
end;

function TFrmChangeEPlantBase.GetIsChanged: Boolean;
begin
  Result:= (rbtnAll.Checked and (FEPlant_ID <> 'NULL'))
           or
           (rbtnOne.Checked and (FEPlant_ID <> QryEPlantPLANT_ID.asString) and (QryEPlantPLANT_ID.asString <> ''))
end;

function TFrmChangeEPlantBase.GetIsViewAll:Boolean ;
begin
  Result:= rbtnAll.Checked;
end;

function TFrmChangeEPlantBase.GetIsViewOne:Boolean ;
begin
  Result:= rbtnOne.Checked;
end;

function TFrmChangeEPlantBase.GetEPlant_ID:string  ;
begin
  Result:= QryEPlantPLANT_ID.asString;
end;

procedure TFrmChangeEPlantBase.btnOKClick(Sender: TObject);
begin
  IQAssert( rbtnAll.Checked or rbtnOne.Checked, IQMS.Common.ResStrings.cTXT0000388 ); // 'Undefined EPlant selection - operation aborted.';

  if rbtnOne.Checked then
    if Trim(wwcombPlant.KeyValueStr) = '' then
       raise Exception.Create(IQMS.Common.ResStrings.cTXT0000208 {'Please select an EPlant'});

  ModalResult:= mrOK;
end;

//procedure TFrmChangeEPlantBase.PnlMainResize(Sender: TObject);
//begin
//  IQMS.Common.Controls.RefreshComponents([wwcombPlant], 55, nil );
//end;

end.
