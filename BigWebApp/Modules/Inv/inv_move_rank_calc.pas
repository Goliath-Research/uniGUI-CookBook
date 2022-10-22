unit inv_move_rank_calc;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmInvMoveRankCalc = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel7: TUniPanel;
    pnlLeftListBox: TUniPanel;
    Panel6: TUniPanel;
    sbtnLeftAll: TUniSpeedButton;
    sbtnRightAll: TUniSpeedButton;
    sbtLeft: TUniSpeedButton;
    sbtnRight: TUniSpeedButton;
    pnlRightListBox: TUniPanel;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Panel9: TUniPanel;
    lboxAvailable: TUniListBox;
    Panel10: TUniPanel;
    Splitter3: TUniSplitter;
    Panel11: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dateFrom: TUniDBDateTimePicker;
    dateTo: TUniDBDateTimePicker;
    Panel8: TUniPanel;
    Bevel1: TUniPanel;
    lboxSelected: TUniListBox;
    Panel12: TUniPanel;
    sbtnDefaultTransType: TUniSpeedButton;
    Label3: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnRightClick(Sender: TObject);
    procedure sbtLeftClick(Sender: TObject);
    procedure sbtnLeftAllClick(Sender: TObject);
    procedure sbtnRightAllClick(Sender: TObject);
    procedure sbtnDefaultTransTypeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure InitForm;
    procedure LoadAvailableTransTypes;
    procedure LoadSelectedTransTypes;
    procedure SaveSelectedTransTypes;
    procedure MoveItems(ASource, ATarget: TUniListBox);
    procedure MoveItemsAll(ASource, ATarget: TUniListBox);
    procedure LoadDefaultTransType;
    procedure Validate;
    procedure CalculateRanking;
    function SelectedTransTypesChanged: Boolean;
  public
    { Public declarations }
    class function DoShowModal(): Boolean;
  end;

implementation

{$R *.dfm}

uses
  inv_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.Trans,
  IQMS.Common.PanelMsg;
  //trans_share;

{ TFrmInvMoveRankCalc }

class function TFrmInvMoveRankCalc.DoShowModal(): Boolean;
Var
LFrmInvMoveRankCalc :TFrmInvMoveRankCalc;
begin
  LFrmInvMoveRankCalc :=TFrmInvMoveRankCalc.Create(UniGuiApplication.UniApplication);
  with LFrmInvMoveRankCalc do
  Begin
    Result:= ShowModal = mrOK;
  end;
end;


procedure TFrmInvMoveRankCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlLeftListBox ]);
  IQRegDateTimeScalarWrite( self, 'FromDate', dateFrom.DateTime );
  IQRegDateTimeScalarWrite( self, 'ToDate',   dateTo.DateTime );
end;

procedure TFrmInvMoveRankCalc.InitForm;
var
  ADate: TDateTime;
begin
  if IQRegDateTimeScalarRead( self, 'FromDate', ADate) and (ADate > 0) then
     dateFrom.DateTime:= ADate;

  dateTo.DateTime:= SelectValueAsFloat('select trunc(sysdate) from dual');
  if IQRegDateTimeScalarRead( self, 'ToDate', ADate) and (ADate > 0) then
     dateTo.DateTime:= ADate;

  LoadSelectedTransTypes;
  LoadAvailableTransTypes;

  if lboxSelected.Items.Count = 0 then
     LoadDefaultTransType;
end;

procedure TFrmInvMoveRankCalc.LoadSelectedTransTypes;
var
  AList: TStringList;
begin
  lboxSelected.ClearSelection;
  lboxSelected.Sorted:= FALSE;
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, 'select trans_type from move_rank_trans_type order by trans_type');
    lboxSelected.Items.Assign( AList );
  finally
    AList.Free;
    lboxSelected.Sorted:= TRUE;
  end;
end;

procedure TFrmInvMoveRankCalc.LoadAvailableTransTypes;
var
  AList: TStringList;
  I: Integer;
begin
  lboxAvailable.ClearSelection;
  lboxAvailable.Clear;
  lboxAvailable.Sorted:= FALSE;
  AList:= TStringList.Create;
  try
    // get all the trans types
    IQMS.WebVcl.Trans.PopulateTransTypeList( AList );

    // add only ones that dont exist in the right listbox
    for I:= 0 to AList.Count - 1 do
      if lboxSelected.Items.IndexOf( AList[ I ]) = -1 then
         lboxAvailable.Items.Add( AList[ I ]);
  finally
    AList.Free;
    lboxAvailable.Sorted:= TRUE;
  end;
end;

procedure TFrmInvMoveRankCalc.sbtLeftClick(Sender: TObject);
begin
  MoveItems( lboxSelected, lboxAvailable )
end;

procedure TFrmInvMoveRankCalc.sbtnLeftAllClick(Sender: TObject);
begin
  MoveItemsAll( lboxAvailable, lboxSelected )
end;

procedure TFrmInvMoveRankCalc.sbtnRightAllClick(Sender: TObject);
begin
  MoveItemsAll( lboxSelected, lboxAvailable );
end;

procedure TFrmInvMoveRankCalc.sbtnRightClick(Sender: TObject);
begin
  MoveItems( lboxAvailable, lboxSelected )
end;

procedure TFrmInvMoveRankCalc.MoveItems( ASource, ATarget: TUniListBox );
var
  I: Integer;
begin
  for I:= ASource.Items.Count - 1 downto 0 do
    if ASource.Selected[ I ] then
    begin
      ATarget.Items.Add( ASource.Items[ I ]);
      ASource.Items.Delete(I);
    end;

  ASource.ClearSelection;
end;

procedure TFrmInvMoveRankCalc.MoveItemsAll( ASource, ATarget: TUniListBox );
var
  I: Integer;
begin
  for I:= 0 to ASource.Items.Count - 1 do
     ATarget.Items.Add( ASource.Items[ I ]);
  ASource.ClearSelection;
  ASource.Clear;
end;

procedure TFrmInvMoveRankCalc.sbtnDefaultTransTypeClick(Sender: TObject);
begin
  if IQConfirmYN( inv_rscstr.cTXT0000177 {'Are you sure you want to load default transaction types?'}) then
     LoadDefaultTransType;
end;


procedure TFrmInvMoveRankCalc.LoadDefaultTransType;
var
  AList: TStringList;

  procedure _CheckAddTransType( S: string );
  var
    I: Integer;
  begin
    // valid trans type
    if AList.IndexOf( S ) = -1 then
       EXIT;

    // not found in the selected
    if lboxSelected.Items.IndexOf( S )> -1 then
       EXIT;

    // add to selected
    lboxSelected.Items.Add( S );

    // remove from the left listbox (available)
    I:= lboxAvailable.Items.IndexOf( S );
    if I > -1 then
       lboxAvailable.Items.Delete(I);
  end;

begin
  AList:= TStringList.Create;
  try
    // first return every to the available list
    sbtnRightAllClick( nil );

    // load valid types
    IQMS.WebVcl.Trans.PopulateTransTypeList( AList );

    // check if valid and does not exist in the selected (precaution) and add
    _CheckAddTransType('DISPOSITION'         );
    _CheckAddTransType('INTERPLANT XFER'     );
    _CheckAddTransType('MANUAL/ASSOCIATED'   );
    _CheckAddTransType('MANUAL/BACKFLUSH'    );
    _CheckAddTransType('PACKING SLIP'        );
    _CheckAddTransType('PM'                  );
    _CheckAddTransType('PO'                  );
    _CheckAddTransType('PO_VMI'              );
    _CheckAddTransType('PROCESS WIP'         );
    _CheckAddTransType('REPAIR'              );
    _CheckAddTransType('REPAIR FINISHED'     );
    _CheckAddTransType('RETURN IN-TRANSIT'   );
    _CheckAddTransType('RMA'                 );
    _CheckAddTransType('TOOLING'             );
    _CheckAddTransType('VMI INTERPLANT XFER' );
    _CheckAddTransType('VMI MOVE LOCATION'   );

  finally
    AList.Free;
  end;
end;

procedure TFrmInvMoveRankCalc.btnOKClick(Sender: TObject);
begin
  if not IQWarningYN('Are you sure you want to continue?') then
     EXIT;

  Validate;

  if SelectedTransTypesChanged then
     SaveSelectedTransTypes;

  CalculateRanking;

  ModalResult:= mrOK;
end;

procedure TFrmInvMoveRankCalc.Validate;
begin
  IQAssert( (dateTo.DateTime >= dateFrom.DateTime) and (dateFrom.DateTime > 0), inv_rscstr.cTXT0000178 {'Invalid date or date range.'});
  IQAssert( lboxSelected.Items.Count > 0, inv_rscstr.cTXT0000179 {'No transaction types selected - opearation aborted'});
end;

function TFrmInvMoveRankCalc.SelectedTransTypesChanged: Boolean;
var
  AList: TStringList;

  function _SameList( List1, List2: TStrings ): Boolean;
  var
    I: Integer;
  begin
    Result:= (lboxSelected.Count = AList.Count);
    if not Result then
       EXIT;

    for I:= 0 to List1.Count - 1 do
      if List2.IndexOf( List1[ I ]) = -1 then
      begin
        Result:= FALSE;
        EXIT;
      end;

    Result:= TRUE;
  end;

begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, 'select trans_type from move_rank_trans_type');

    Result:= not _SameList( lboxSelected.Items, AList );
  finally
    AList.Free;
  end;
end;


procedure TFrmInvMoveRankCalc.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQRegFormRead( self, [ self, pnlLeftListBox ]);
  InitForm;
end;

procedure TFrmInvMoveRankCalc.SaveSelectedTransTypes;
var
  I: Integer;
begin
  ExecuteCommand('truncate table move_rank_trans_type');

  for I:= 0 to lboxSelected.Count - 1 do
    ExecuteCommandFmt('declare                                                               '+
              '  v_trans_type      move_rank_trans_type.trans_type%%type::= ''%s'';  '+
              '  v_trans_type_code number;                                           '+
              'begin                                                                 '+
              '  v_trans_type_code::= trans_share.get_trans_code( v_trans_type );    '+
              '  if v_trans_type_code = -1 then                                      '+
              '     return;                                                          '+
              '  end if;                                                             '+
              '                                                                      '+
              '  insert into move_rank_trans_type                                    '+
              '       ( trans_type_code, trans_type )                                '+
              '  values                                                              '+
              '       ( v_trans_type_code, v_trans_type );                           '+
              'end;                                                                  ',
              [ lboxSelected.Items[ I ] ]);
end;

procedure TFrmInvMoveRankCalc.CalculateRanking;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait;
  try
    ExecuteCommandFmt('begin                                                               '+
              '  inv_move_class_misc.rank_items( to_date(''%s'', ''mm/dd/yyyy''),  '+
              '                                  to_date(''%s'', ''mm/dd/yyyy'')); '+
              'end;                                                                ',
              [ FormatDateTime( 'mm/dd/yyyy', dateFrom.DateTime ),
                FormatDateTime( 'mm/dd/yyyy', dateTo.DateTime ) ]);
  finally
    hMsg.Free;
  end;
end;

end.



















