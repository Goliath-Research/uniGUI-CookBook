unit RevTree;

interface


uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  LotTree,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniTreeView,
  uniGUIAbstractClasses,
  MainModule, IQMS.WebVcl.About, Vcl.Menus, uniMainMenu, uniStatusBar,
  uniGUIClasses, uniButton, uniBitBtn, uniSpeedButton, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniPanel,uniGUIApplication;

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
  TFrmRevLotTree = class(TFrmLotTree)
  private
    { Private declarations }
    procedure AddTVNode(AParentNode: TUniTreeNode; ATransLogId:Real);override;
    procedure PopulateChildNodes(AParentNode: TUniTreeNode; ALotno:String; ArinvtID:Real; ATreeLevel:Integer);override;
  public
    { Public declarations }
  end;

procedure DoRevLotTree;

implementation
uses
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;
{$R *.DFM}

constructor TTVCargo.Create( const ALotno, AFgLotno : string; ATranslogId, AArinvtId:Real; ATreeLevel:Integer  );
begin
  Lotno       := ALotno      ;
  FgLotno     := AFgLotno    ;
  TransLogID  := ATransLogID ;
  ArinvtID    := AArinvtID   ;
  TreeLevel   := ATreeLevel  ;
end;

procedure DoRevLotTree;
var
  LFrmRevLotTree : TFrmRevLotTree;
begin
    LFrmRevLotTree := TFrmRevLotTree.Create(UniGUIApplication.UniApplication);
    LFrmRevLotTree.Show;
end;

procedure TFrmRevLotTree.AddTVNode(AParentNode: TUniTreeNode; ATransLogId:Real);
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
                                                                                0));      }
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

procedure TFrmRevLotTree.PopulateChildNodes(AParentNode: TUniTreeNode; ALotno:String; ArinvtID:Real; ATreeLevel:Integer);
var
  ABatch:Real;
  ACurrentNode:TUniTreeNode;
  AQry1, AQry2:TFDQuery;
begin
  {prevent circular reference}
//  if FProcessedLotNoList.IndexOf( ALotno ) > -1 then
  if FProcessedLotNoList.IndexOf( ALotno + FloatToStr(ArinvtID) ) > -1 then
     EXIT;
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain a member named SimpleText
  StatusBar1.SimpleText:= Format('Processing Lot # %s...', [ Trim(ALotNo) ]);   }
  StatusBar1.Update;

//  FProcessedLotNoList.Add( ALotno );
  FProcessedLotNoList.Add( ALotno + FloatToStr(ArinvtID));
  

  AQry1 := TFDQuery.Create(self);
  try
    AQry1.Connection := UniMainModule.FDConnection1;
    AQry1.Sql.Add(Format('select fg_lotno, parent_arinvt_id from ' +
                             'translog where RTrim(fg_lotno) is not null and itemno is not null ' +
                             'and lotno = ''%s'' and arinvt_id = %f and parent_arinvt_id is not null' , [StrTran(ALotno, '''', ''''''), ArinvtID]));
    AQry1.Open;
    while not AQry1.eof do
    begin
      AQry2 := TFDQuery.Create(self);
      try
        AQry2.Connection := UniMainModule.FDConnection1;
        AQry2.Sql.Add(Format('select distinct arinvt_id, itemno, lotno from ' +
                             'translog where lotno = ''%s'' and arinvt_id = %f' ,
                             [StrTran(AQry1.FieldByName('fg_lotno').asString, '''', ''''''),
                              AQry1.FieldByName('parent_arinvt_id').asFloat]));
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
                                                                                   '',
                                                                                   0,
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


end.
