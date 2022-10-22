unit LotTree;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniTreeView,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniMainMenu;

type
  TTVCargo = class
    Lotno      : string;
    FgLotno    : string;
    TransLogID : Real;
    ArinvtID   : Real;
    TreeLevel  :Integer;
    constructor Create( const ALotno, AFgLotno : string; ATranslogId, AArinvtId:Real; ATreeLevel:Integer );
  end;


type
  TFrmLotTree = class(TUniForm)
    Panel3: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    TV: TUniTreeView;
    sbtnPrint: TUniSpeedButton;
    N1: TUniMenuItem;
    Expand1: TUniMenuItem;
    FullCollapse1: TUniMenuItem;
    Print1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    StatusBar1: TUniStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnExpandClick(Sender: TObject);
    procedure sbtnCollapseClick(Sender: TObject);
    procedure sbtnPrintClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
{ TODO -oGPatil -cWebConvert : TTVChangedEvent Undeclared Identifier in ClearTreeView
    procedure ClearTreeView;  }
    procedure PrintCRW;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  protected
    FProcessedLotNoList: TStringList;
  public
    { Public declarations }
    FList:TStringList;
    destructor Destroy; override;
    procedure AddTVNode(AParentNode: TUniTreeNode; ATransLogId:Real);virtual;
    procedure PopulateChildNodes(AParentNode: TUniTreeNode; ALotno:String; ArinvtID:Real; ATreeLevel:Integer);virtual;
    function  UniquePath(AParentNode:TUniTreeNode; AArinvtId:Real; ALotno:String):Boolean;
  end;

procedure DoLotTree;

implementation
uses
  IQMS.WebVcl.DocumentsExternal,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  System.Variants,
  System.Win.ComObj;
{$R *.DFM}

constructor TTVCargo.Create( const ALotno, AFgLotno : string; ATranslogId, AArinvtId:Real; ATreeLevel:Integer  );
begin
  Lotno       := ALotno      ;
  FgLotno     := AFgLotno    ;
  TransLogID  := ATransLogID ;
  ArinvtID    := AArinvtID   ;
  TreeLevel   := ATreeLevel  ;
end;

procedure DoLotTree;
var
  LFrmLotTree : TFrmLotTree;
begin
  LFrmLotTree := TFrmLotTree.Create(UniGUIApplication.UniApplication);
  LFrmLotTree.Show;
end;

procedure TFrmLotTree.UniFormCreate(Sender: TObject);
begin
  FProcessedLotNoList:= TStringList.Create;
  IQRegFormRead( self, [self]);

  //PostMessage( Handle, iq_AfterShowMessage, 0, Trunc(AID));
end;

destructor TFrmLotTree.Destroy;
begin
  FProcessedLotNoList.Free;
  inherited;
end;

procedure TFrmLotTree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmLotTree.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLotTree.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

{ TODO -oGPatil -cWebConvert : TTVChangedEvent Undeclared Identifier
procedure TFrmLotTree.ClearTreeView;
var
  ANode    : TUniTreeNode;
  AOnChange: TTVChangedEvent;
begin
  with TV do
  try
    AOnChange:= OnChange;
    OnChange := NIL;
    Items.BeginUpdate;
    ANode:= Items.GetFirstNode;
    while Assigned( ANode ) do
    begin
      if Assigned(ANode.Data) then
         TObject(ANode.Data).Free;

      ANode:= ANode.GetNext;
    end;
    Items.Clear;
  finally
    OnChange:= AOnChange;
    Items.EndUpdate;
  end;
end;  }

procedure TFrmLotTree.AddTVNode(AParentNode: TUniTreeNode; ATransLogId:Real);
var
  ACurrentNode:TUniTreeNode;
begin
  FList :=TStringList.Create;
  try
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IQFormat('select arinvt_id, itemno, lotno, fg_lotno from translog where id = %f', [ATransLogId]));
      Open;
      if not (eof and bof) then
      begin
{ TODO -oGPatil -cWebConvert : TUniTreeNode does not contain a member named AddChildObject
        ACurrentNode := TV.Items.AddChildObject( AParentNode,  Format('%s [%s]',
                                                                     [FieldByName('itemno').asString,
                                                                      FieldByName('lotno').asString]),
                                                               TTVCargo.Create( FieldByName('lotno').asString,
                                                                                FieldByName('fg_lotno').asString,
                                                                                ATransLogId,
                                                                                FieldByName('arinvt_id').asFloat,
                                                                                0));    }
        PopulateChildNodes(ACurrentNode, FieldByName('lotno').asString, FieldByName('arinvt_id').asFloat, 1);
      end;
    finally
      free;
    end;
  finally
    FList.Free;
  end;
  if TV.Items.Count = 1 then
    TV.Items.AddChild( ACurrentNode, '');
  sbtnExpandClick(nil);
end;

procedure TFrmLotTree.PopulateChildNodes(AParentNode: TUniTreeNode; ALotno:String; ArinvtID:Real; ATreeLevel:Integer);
var
  ABatch:Real;
  ACurrentNode:TUniTreeNode;
  AQry1, AQry2:TFDQuery;
begin
  if Trim(ALotno) = '' then
     EXIT;

  {prevent circular reference}
  if FProcessedLotNoList.IndexOf( ALotno + FloatToStr(ArinvtID) ) > -1 then
     EXIT;

{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain a member named SimpleText
  StatusBar1.SimpleText:= Format('Processing Lot # %s...', [ Trim(ALotNo) ]);  }
  StatusBar1.Update;

  FProcessedLotNoList.Add( ALotno + FloatToStr(ArinvtID));

  AQry1 := TFDQuery.Create(self);
  try
    AQry1.Connection := UniMainModule.FDConnection1;
    AQry1.Sql.Add(Format('select distinct batch from translog where fg_lotno = ''%s'' and parent_arinvt_id = %f and itemno is not null',
    [StrTran(ALotno, '''', ''''''), ArinvtID]));
    AQry1.Open;
    while not AQry1.eof do
    begin
      AQry2 := TFDQuery.Create(self);
      try
        AQry2.Connection := UniMainModule.FDConnection1;
        AQry2.Sql.Add(IQFormat('select id, arinvt_id, itemno, lotno, fg_lotno from ' +
                               'translog where RTrim(fg_lotno) is not null and itemno is not null ' +
                               'and fg_lotno = ''%s'' and batch = %f' , [StrTran(ALotno, '''', ''''''), AQry1.FieldByName('batch').asFloat]));
        AQry2.Open;
        while not AQry2.eof do
        begin
         if UniquePath(AParentNode, AQry2.FieldByName('arinvt_id').asFloat, AQry2.FieldByName('lotno').asString) then
         begin
{ TODO -oGPatil -cWebConvert : TUniTreeNode does not contain a member named AddChildObject
            ACurrentNode := TV.Items.AddChildObject( AParentNode,  Format('%s [%s]',
                                                                        [AQry2.FieldByName('itemno').asString,
                                                                         AQry2.FieldByName('lotno').asString]),
                                                                  TTVCargo.Create( AQry2.FieldByName('lotno').asString,
                                                                                   AQry2.FieldByName('fg_lotno').asString,
                                                                                   AQry2.FieldByName('id').asFloat,
                                                                                   AQry2.FieldByName('arinvt_id').asFloat,
                                                                                   ATreeLevel));  }
            PopulateChildNodes(ACurrentNode, AQry2.FieldByName('lotno').asString, AQry2.FieldByName('arinvt_id').asFloat, ATreeLevel + 1);
          end;
          AQry2.Next;
        end;
      finally
        AQry2.Free;
      end;
      AQry1.Next;
    end;
  finally
    AQry1.Free;
  end;
end;

procedure TFrmLotTree.sbtnExpandClick(Sender: TObject);
begin
  with TV do
  begin
    FullExpand;
    Selected:= Items.GetFirstNode;
{ TODO -oGPatil -cWebConvert : TUniTreeView does not contain a member named TopItem
    TopItem := Selected;  }
  end;
end;

procedure TFrmLotTree.sbtnCollapseClick(Sender: TObject);
begin
  TV.FullCollapse;
end;

function TFrmLotTree.UniquePath(AParentNode:TUniTreeNode; AArinvtId:Real; ALotno:String):Boolean;
var
  APath:String;
  ANode:TUniTreeNode;
  I:Integer;
begin
  Result := False;
  aPath := FloatToStr(AArinvtId) + ALotno;
  ANode := AParentNode;
  while ANode <> nil do
  begin
    APath := FloatToStr(TTVCargo(ANode.Data).ArinvtId) + TTVCargo(ANode.Data).LotNo + APath;
    ANode := ANode.Parent;
  end;
  for I := 0 to FList.Count - 1 do
  if APath = FList[I] then
  begin
    Result := False;
    Exit;
  end;
  FList.Add(APath);
  Result := True;
end;

procedure TFrmLotTree.PrintCRW;
var
  AFileName: string;
  WordApp  : OLEVariant;
  hMsg     : TPanelMesg;
begin
  hMsg:= hPleaseWait( '' );
  try
    TV.FullExpand;
    TV.Items.GetFirstNode.Selected:= TRUE;

    {Export to File}
    AFileName:= IQGetLocalHomePath + 'Lot_Tree.doc';
{ TODO -oGPatil -cWebConvert : TUniTreeView does not contain a member named SaveToFile
    TV.SaveToFile( AFileName );  }

    {Flip on a side - Landscape}
    WordApp:= CreateOleObject('Word.Application');
    try
      WordApp.Documents.Open( AFileName, FALSE, FALSE, FALSE );
      WordApp.ActiveDocument.PageSetup.LineNumbering.Active:= 0;
      WordApp.ActiveDocument.PageSetup.Orientation:= 1;         // wdOrientLandscape
      WordApp.ActiveDocument.PageSetup.LeftMargin := 18;        // 0.25 * 72 (72 = 1")
      WordApp.ActiveDocument.PageSetup.RightMargin:= 18;
      //WordApp.ActiveDocument.PageSetup.PageWidth  := 1008;    // 14"
      //WordApp.ActiveDocument.PageSetup.PageHeight := 612;     // 8.5"
      WordApp.ActiveDocument.SaveAs( AFileName, 0 );            // 0 = wdFormatDocument - save as a ms doc
    finally
      WordApp.Application.Quit;
      WordApp:= NULL;
    end;

    Sleep(5000);                           {Sometimes ShellExecute cannot print 2 docs back to back too fast}
    IQShellExecute( AFileName, 'print' );  {IQMS.WebVcl.DocumentsExternal.pas}
  finally
    hMsg.Free;
  end;
end;

procedure TFrmLotTree.sbtnPrintClick(Sender: TObject);
begin
  if IqConfirmYN('Do you wish to print the tree?') then PrintCRW;
end;

procedure TFrmLotTree.IQAfterShowMessage(var Msg: TMessage);
begin
  try
{ TODO -oGPatil -cWebConvert : TTVChangedEvent Undeclared Identifier in ClearTreeView
    ClearTreeView;  }
    FProcessedLotNoList.Clear;
    AddTVNode( nil, Msg.LParam {Translog_ID} );
  finally
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain a member named SimpleText
    StatusBar1.SimpleText:= '';  }
  end;
end;

end.
