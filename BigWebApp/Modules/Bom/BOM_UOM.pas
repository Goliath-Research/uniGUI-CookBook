unit Bom_Uom;

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
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmBom_UomSelect = class(TUniForm)
    Panel1: TUniPanel;
    btnAssign: TUniButton;
    btnConvert: TUniButton;
    btnNew: TUniButton;
    ListBox1: TUniListBox;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure btnAssignClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AdjustPosition;
    function GetDataSet:TDataSet;
    function GetDataField:string;
  protected
    procedure LoadListBox; virtual;
    procedure ConvertBetween( OldUOM, NewUOM:string );
    function GetID:Real;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); virtual;
    //function ConvertValueFrom( OldValue:Real ):Real; virtual;
    procedure SaveNewUOM( AState: TDataSetState ); virtual;
    procedure BeforeSaveAs; virtual;
  public
    { Public declarations }
    property FDataSet  : TDataSet read GetDataSet;
    property FDataField: string read GetDataField;
  end;

function GetBOM_UOM :Boolean;


implementation

{$R *.DFM}

uses
  bom_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns,}
  IQMS.Common.UOM,
  { TODO -oathite -cWebConvert : Dependent on Uom_Lst
  Uom_Lst, }
  uniComboBox,
  uniDBComboBox;

function GetBOM_UOM :Boolean;
var
  LFrmBom_UomSelect : TFrmBom_UomSelect;
begin
  LFrmBom_UomSelect := TFrmBom_UomSelect.Create( uniGUIApplication.UniApplication );
  Result:= LFrmBom_UomSelect.ShowModal = mrOK;
end;

procedure TFrmBom_UomSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Owner is TUniDBComboBox then with Owner as TUniDBComboBox do
  begin
    PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
    Update;
  end
  else if Owner is TUniDBComboBox then with Owner as TUniDBComboBox do
  begin
    PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
    Update;
  end;

  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmBom_UomSelect.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmBom_UomSelect.AdjustPosition;
var
  R: Integer;
  P: TPoint;
  W: Integer;
begin
  W:= Width;
  IQRegFormRead( self, [ self ]);  {to get height}

  { TODO -oathite -cWebConvert : Invalid TypeCast
  with Owner as TControl do
  begin
    P.X:= Left;
    P.Y:= Top  + Height + 1;
    P:= Parent.ClientToScreen( P );
  end;
  }
  Left := P.X;
  Top  := P.Y;
  Width:= W;
end;

procedure TFrmBom_UomSelect.LoadListBox;
begin
  if Owner is TUniDBComboBox then with Owner as TUniDBComboBox do
  begin
    ListBox1.Clear;
    ListBox1.Items.Assign( Items );
    ListBox1.ItemIndex:= ListBox1.Items.IndexOf( Text );
  end
  else if Owner is TUniDBComboBox then with Owner as TUniDBComboBox do
  begin
    ListBox1.Clear;
    ListBox1.Items.Assign( Items );
    ListBox1.ItemIndex:= ListBox1.Items.IndexOf( Text );
  end;
  // PopulateUOMs( ListBox1.Items );  {UOM_Lst}
end;

function TFrmBom_UomSelect.GetDataSet:TDataSet;
begin
  if Owner is TUniDBComboBox then with (Owner as TUniDBComboBox), DataSource do
     Result:= DataSet
  else if Owner is TUniDBComboBox then with (Owner as TUniDBComboBox), DataSource do
     Result:= DataSet;
end;

function TFrmBom_UomSelect.GetDataField:string;
begin
  if Owner is TUniDBComboBox then with (Owner as TUniDBComboBox), DataSource do
     Result:= DataField
  else if Owner is TUniDBComboBox then with (Owner as TUniDBComboBox), DataSource do
     Result:= DataField;
end;

procedure TFrmBom_UomSelect.btnAssignClick(Sender: TObject);
var
  AState: TDataSetState;
begin
  if ListBox1.ItemIndex = -1 then
     EXIT;

  BeforeSaveAs;

  if Assigned( FDataSet ) then with FDataSet do
    if FieldByName( FDataField ).asString <> ListBox1.Items[ ListBox1.ItemIndex ] then
       begin
         AState:= State;
         Edit;
         FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];
         SaveNewUOM( AState );
       end;
  ModalResult:= mrOK;
end;

procedure TFrmBom_UomSelect.SaveNewUOM( AState: TDataSetState );
begin
  FDataSet.Post;
end;

procedure TFrmBom_UomSelect.UniFormCreate(Sender: TObject);
begin
  AdjustPosition;
  LoadListBox;
end;

procedure TFrmBom_UomSelect.btnConvertClick(Sender: TObject);
begin
  if ListBox1.ItemIndex = -1 then EXIT;

  if Assigned( FDataSet ) then with FDataSet do
     if FieldByName( FDataField).asString <> ListBox1.Items[ ListBox1.ItemIndex ] then
       ConvertBetween( FieldByName( FDataField).asString,
                       ListBox1.Items[ ListBox1.ItemIndex ] {New} );
  ModalResult:= mrOK;
end;

procedure TFrmBom_UomSelect.ConvertBetween( OldUOM, NewUOM: string );
var
  ADB: TFDConnection;
begin
  OldUOM := Trim( UpperCase( OldUOM ));
  NewUOM := Trim( UpperCase( NewUOM ));

  if (OldUOM <> NewUOM) and (OldUOM <> '') and (NewUOM <> '') then
  try
    ADB:= UniMainModule.FDConnection1;
    ADB.StartTransaction;
    try
      ApplyConvertTo( GetID, OldUOM, NewUOM );
      ADB.Commit;
    finally
      if ADB.InTransaction then
         ADB.RollBack;
    end;
  except on E:Exception do
    // bom_rscstr.cTXT0000037 = 'Unable to convert %s to %s.';
    raise Exception.Create(Format(bom_rscstr.cTXT0000037, [OldUOM, NewUOM]) + #13 + E.Message);
  end;
end;

function TFrmBom_UomSelect.GetID:Real;
begin
  if Assigned( FDataSet ) then with FDataSet do
     Result:= FieldByName('ID').asFloat
  else
     Result:= -0;
end;

//function TFrmBom_UomSelect.ConvertValueFrom( OldValue:Real ):Real;
//begin
//  with FStoredProc do
//  begin
//    Close;
//    ParamByName('v_data').Value := OldValue;
//    Prepare;
//    ExecProc;
//    Result:= Params[ 0 ].asFloat;
//  end;
//end;

procedure TFrmBom_UomSelect.ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string );
var
  I:Integer;
begin
  if Assigned( FDataSet ) then with FDataSet do
  begin
    // update partno set ptwt_disp = UOM.IQConvert( 'LBS', 'KG', ptwt_disp, arinvt_id ) where standard_id = 123
    // note: do a "simple" convert without arinvt_uom_conv table. Instead of arinvt_id - pass (-1 )
    ExecuteCommandFmt('update partno set ptwt_disp = UOM.IQConvert( ''%s'', ''%s'', ptwt_disp, -1 ) where standard_id = %f',
              [ AFromUOM, AToUOM, ID ]);
    {Standard}
    Edit;
    FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];
    FieldByName('SPRUE_DISP').asFloat:= IQConvertUom( FieldByName('SPRUE_DISP').asFloat, AFromUOM, AToUOM, -1 ); {IQMS.Common.UOM.pas}
    Post;

    with TFDCustomQuery(FDataSet).Connection do
     for I:= 0 to DataSetCount - 1 do 
       if (DataSets[ I ].ClassType = TFDTable) then with DataSets[ I ] as TFDTable do
         if (CompareText('PARTNO', TableName) = 0) or (CompareText('IQMS.PARTNO', TableName) = 0) then
             TFDTable( DataSets[ I ]).Refresh;
  end;
end;

procedure TFrmBom_UomSelect.BeforeSaveAs;
begin
//   with (Owner as TDBComboBox).DataSource.DataSet do
  if not IQWarningYN(Format('''Save As'' option does NOT convert but marks UOM as %s.'#13+
                            'Use ''Convert To'' option to convert to %s if it is possible'#13#13+
                            'Are you sure you want to continue?',
                            [ ListBox1.Items[ ListBox1.ItemIndex ],
                              ListBox1.Items[ ListBox1.ItemIndex ] ])) then
       ABORT;
end;

procedure TFrmBom_UomSelect.btnNewClick(Sender: TObject);
var
  ANew: string;
  AOld: string;
begin
  with ListBox1 do
  begin
    if ItemIndex > -1 then AOld:= Items[ ItemIndex ] else AOld:= '';
    { TODO -oathite -cWebConvert : Dependent on Uom_Lst
    ANew:= DoUOMListSelectOnDoubleClick;  {Uom_Lst.pas}

    LoadListBox;

    if ANew <> '' then with ListBox1 do
      ItemIndex:= Items.IndexOf( ANew )
    else if AOld > '' then
      ItemIndex:= Items.IndexOf( AOld );
  end;
end;

end.
