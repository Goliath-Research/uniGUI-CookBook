unit Tran_Dsp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQUniGrid,
  uniGUIFrame;

type
  TFrmTransDispoDesignator = class(TUniForm)
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgCOMPANY: TStringField;
    PkMfgID: TBCDField;
    PkMfgMFG_TYPE: TStringField;
    PkMfgDESCRIP2: TStringField;
    SrcFGMultiDispoBom: TDataSource;
    QryFGMultiDispoBom: TFDQuery;
    QryFGMultiDispoBomID: TBCDField;
    QryFGMultiDispoBomSTANDARD_ID: TBCDField;
    QryFGMultiDispoBomFGMULTI_ID: TBCDField;
    QryFGMultiDispoBomMfgNo: TStringField;
    UpdateSQLFGMultiDispoBom: TFDUpdateSQL;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    NavMfg: TUniDBNavigator;
    PnlCarrier: TUniPanel;
    chkDefault: TUniCheckBox;
    chkClear: TUniCheckBox;
    grdMfg: TIQUniGridControl;
    wwDBComboBoxMfgNo: TUniDBComboBox;
    chkMfg: TUniCheckBox;
    procedure chkMfgClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFGMultiDispoBomBeforeOpen(DataSet: TDataSet);
//    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBComboBoxMfgNoDropDown(Sender: TObject);
    procedure QryFGMultiDispoBomBeforePost(DataSet: TDataSet);
    procedure QryFGMultiDispoBomCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FTblFgMulti : TFDTable;
    FLocations_Auto_Dispo_Default_Loc: Boolean;
    procedure Validate;
    procedure InitVars;
  public
    { Public declarations }
    property TblFGMulti: TFDTable read FTblFgMulti write FTblFgMulti;
  end;

procedure AssignAutoDispoDesignator( ATblFgMulti: TFDTable );


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  trans_non_conf_dispo_designated_chk;

procedure AssignAutoDispoDesignator( ATblFgMulti: TFDTable );
var
  FrmTransDispoDesignator: TFrmTransDispoDesignator;
begin
  FrmTransDispoDesignator:=TFrmTransDispoDesignator.Create(uniGUIApplication.UniApplication);
  with FrmTransDispoDesignator do
  begin
    TblFGMulti:=ATblFgMulti;
    ShowModal;
  end;
end;

procedure TFrmTransDispoDesignator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmTransDispoDesignator.InitVars;
begin
  chkMfg.OnClick    := NIL;
  chkDefault.OnClick:= NIL;
  chkClear.OnClick  := NIL;
  try
    if SelectValueFmtAsFloat('select count(*) from fgmulti_dispo_bom where fgmulti_id = %f', [ TblFgMulti.FieldByName('id').asFloat ]) > 0 then
       chkMfg.Checked:= TRUE;

    if (SelectValueFmtAsString('select auto_dispo_default_loc from fgmulti where id = %f', [ TblFgMulti.FieldByName('id').asFloat ]) = 'Y') then
      chkDefault.Checked:= TRUE;

    if FLocations_Auto_Dispo_Default_Loc then
    begin
       chkDefault.Checked:= TRUE;
       chkDefault.Enabled:= FALSE;

       chkClear.Checked:= FALSE;
       chkClear.Enabled:= FALSE;
    end;

  finally
    chkMfg.OnClick    := chkMfgClick;
    chkDefault.OnClick:= chkMfgClick;
    chkClear.OnClick  := chkMfgClick;
  end;
end;

procedure TFrmTransDispoDesignator.chkMfgClick(Sender: TObject);
begin
  chkMfg.OnClick    := NIL;
  chkDefault.OnClick:= NIL;
  chkClear.OnClick  := NIL;
  try
    if (Sender = chkMfg) and (chkMfg.Checked) then
       chkClear.Checked:= FALSE;
    if (Sender = chkDefault) and (chkDefault.Checked) then
       chkClear.Checked:= FALSE;
    if (Sender = chkClear) and (chkClear.Checked) then
    begin
       chkMfg.Checked:= FALSE;
       chkDefault.Checked:= FALSE;
    end;
  finally
    chkMfg.OnClick    := chkMfgClick;
    chkDefault.OnClick:= chkMfgClick;
    chkClear.OnClick  := chkMfgClick;
  end;
  IQEnableControl( grdMfg, chkMfg.Checked );
  IQEnableControl( NavMfg, chkMfg.Checked );
end;

procedure TFrmTransDispoDesignator.btnOKClick(Sender: TObject);
begin
  Validate;
  TblFGMulti.CheckBrowseMode;

  if chkClear.Checked then
     begin
       ExecuteCommandFmt('update fgmulti set auto_dispo_standard_id = NULL, auto_dispo_default_loc = ''N'' where id = %f',
                 [ TblFGMulti.FieldByName('id').asFloat ]);
       ExecuteCommandFmt('delete fgmulti_dispo_bom where fgmulti_id = %f',
                 [ TblFGMulti.FieldByName('id').asFloat ]);
     end
  else
    begin
      CheckLocationNonConformDispoDesignated( TblFGMulti.FieldByName('id').asFloat, tntLocationToDispoDesignated ); // trans_non_conf_dispo_designated_chk.pas

      if chkMfg.Checked then
         ExecuteCommandFmt('update fgmulti set auto_dispo_standard_id = %f where id = %f',
                   [ QryFGMultiDispoBomSTANDARD_ID.asFloat, TblFGMulti.FieldByName('id').asFloat ])
      else
         begin
            ExecuteCommandFmt('update fgmulti set auto_dispo_standard_id = NULL where id = %f',
                      [ TblFGMulti.FieldByName('id').asFloat ]);
            ExecuteCommandFmt('delete fgmulti_dispo_bom where fgmulti_id = %f',
                      [ TblFGMulti.FieldByName('id').asFloat ]);
         end;

      ExecuteCommandFmt('update fgmulti set auto_dispo_default_loc = ''%s'' where id = %f',
                [ IIf( chkDefault.Checked, 'Y', 'N'), TblFGMulti.FieldByName('id').asFloat ])
    end;

  TblFGMulti.Refresh;
  ModalResult:= mrOK;
end;

procedure TFrmTransDispoDesignator.Validate;
begin
  if not (chkMfg.Checked or chkDefault.Checked or chkClear.Checked) then
     raise Exception.Create('Use check boxes to make your selection');

  if chkMfg.Checked and (QryFGMultiDispoBom.Eof and QryFGMultiDispoBom.Bof) then
     raise Exception.Create('No Mfg# is selected');

  if chkMfg.Checked or chkDefault.Checked then
     if SelectValueFmtAsString('select VMI from locations, fgmulti where fgmulti.id = %f and fgmulti.loc_id = locations.id',[ TblFGMulti.FieldByName('id').asFloat ]) = 'Y' then
        raise Exception.Create('A VMI location cannot be used as Auto Disposition Designator');
end;

procedure TFrmTransDispoDesignator.QryFGMultiDispoBomBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'fgmulti_id', TblFGMulti.FieldByName('ID').AsLargeInt);
end;

//procedure TFrmTransDispoDesignator.CheckRefresh(Sender: TObject;
//  Button: TNavigateBtn);
//begin
//  if Button = nbRefresh then
//  begin
//    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
//    ABORT;
//  end;
//end;

procedure TFrmTransDispoDesignator.wwDBComboBoxMfgNoDropDown(Sender: TObject);
begin
  with PkMfg do
    if Execute then
    begin
      QryFGMultiDispoBom.Edit;
      QryFGMultiDispoBomSTANDARD_ID.asFloat:= GetValue('ID');
      QryFGMultiDispoBom.Post;
    end;
end;

procedure TFrmTransDispoDesignator.QryFGMultiDispoBomBeforePost(
  DataSet: TDataSet);
begin
  with DataSet do
  begin
    if FieldByName('fgmulti_id').asFloat = 0 then
       FieldByName('fgmulti_id').asFloat:= TblFGMulti.FieldByName('id').asFloat;
    if FieldByName('id').asFloat = 0 then
       FieldByName('id').asFloat:= GetNextID('fgmulti_dispo_bom');
  end;
end;

procedure TFrmTransDispoDesignator.QryFGMultiDispoBomCalcFields(
  DataSet: TDataSet);
begin
  QryFGMultiDispoBomMfgNo.AsString := SelectValueFmtAsString(
    'SELECT mfgno FROM standard WHERE id = %d',
    [QryFGMultiDispoBomSTANDARD_ID.AsLargeInt]);
end;

procedure TFrmTransDispoDesignator.UniFormCreate(Sender: TObject);
begin
  FLocations_Auto_Dispo_Default_Loc:= SelectValueFmtAsString('select locations.auto_dispo_default_loc from locations, fgmulti where fgmulti.id = %f and fgmulti.loc_id = locations.id',[ TblFGMulti.FieldByName('id').asFloat ]) = 'Y';


  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );

  InitVars;
  //chkClear.Checked:= TRUE;
  //chkMfgClick(chkClear);

//  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCarrier);
end;

end.
