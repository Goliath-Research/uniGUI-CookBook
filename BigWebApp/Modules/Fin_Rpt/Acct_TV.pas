unit Acct_TV;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  Buttons,
  ImgList,
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
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniTreeView,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFinCargo = class
    Header: string;
    Footer: string;
    AcctID: Real;
    sId       : Real;
    sParentId : Real;
    constructor Create( const AHeader, AFooter : string; AAcctID, AId, AParentId:Real);
  end;

  TAcctTreeView = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    TreeView1: TUniTreeView;
    QryAcct: TFDQuery;
    PnlToolbarMain: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    QryGLAcct: TFDQuery;
    QryGLAcctID: TBCDField;
    QryGLAcctACCT: TStringField;
    QryGLAcctDESCRIP: TStringField;
    QryGLAcctGL_SUBACCT_TYPE_ID: TBCDField;
    Bevel1: TUniPanel;
    ImageList1: TUniImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnExpandClick(Sender: TObject);
    procedure sbtnCollapseClick(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TUniTreeNode);
    procedure TreeView1Collapsed(Sender: TObject; Node: TUniTreeNode);
    procedure TreeView1Expanding(Sender: TObject; Node: TUniTreeNode;
      var AllowExpansion: Boolean);
  private
    { Private declarations }
    function GetStatus:string;
    procedure SetStatus( const AValue:string );
    function GetState:string;
    procedure SetState( const AValue:string );
    procedure ClearTreeView;
    function GetNextNodeIDByParent( AParent:TUniTreeNode; const AType:string ):TUniTreeNode;
    function FindNodeByName( AParent:TUniTreeNode; const AType:string ):TUniTreeNode;
    procedure DeleteEmptyNodes;
    procedure SetPkTreeview(const Value: Boolean);
  public
    { Public declarations }
    Changing : Boolean;
    Merging  : Boolean;
    FPkTreeview:boolean;
    property PkTreeview: Boolean read FPkTreeview write SetPkTreeview;
    property Status: string read GetStatus write SetStatus;
    property State : string read GetState  write SetState;
    procedure LoadTreeViewFromQuery; virtual;
    procedure BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer; AQuery:TFDQuery);virtual;
    procedure LoadSubTreeViewFromQuery( AQuery: TFDQuery ); virtual;
    procedure MajorTypeProcess( Node: TUniTreeNode; DataSet: TDataSet ); virtual;
    procedure SubTypeProcess  ( Node: TUniTreeNode; DataSet: TDataSet  ); virtual;
    procedure UserTypeProcess ( Node: TUniTreeNode; DataSet: TDataSet  ); virtual;
    procedure GLAcctProcess   ( Node: TUniTreeNode; DataSet: TDataSet  ); virtual;
    procedure AssignAccounts(Node:TUniTreeNode; nId:Real);
    procedure AssignAccounts2(Node:TUniTreeNode; nId:Real);
    function  AssignAccount(Node:TUniTreeNode; nGlAcctId, nId, nParentId:Real; Header, Footer:String; ALevel:Integer):TUniTreeNode;
  end;

  procedure DoCreate(APkTreeview:boolean = true);

implementation

{$R *.DFM}

uses
  fin_rpt_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;


{ TFinCargo }

constructor TFinCargo.Create( const AHeader, AFooter : string; AAcctID, AId, AParentId:Real);
begin
  Header:= AHeader;
  Footer:= AFooter;
  AcctID:= AAcctID;
  sID         := AID       ;
  sParentId   := AParentId ;
end;

{ TAcctTreeView }

procedure DoCreate(APkTreeview:boolean = true);
var
  LAcctTreeView: TAcctTreeView;
begin
  LAcctTreeView := TAcctTreeView.Create(uniGUIApplication.UniApplication);
  LAcctTreeView.PkTreeview := APkTreeview;
  LAcctTreeView.ShowModal;
end;


procedure TAcctTreeView.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  Merging:= FALSE;
end;

procedure TAcctTreeView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

function TAcctTreeView.GetStatus:string;
begin
  Result:= StatusBar1.Panels[ 1 ].Text;
end;

procedure TAcctTreeView.SetStatus( const AValue:string );
begin
  StatusBar1.Panels[ 1 ].Text:= AValue;
  StatusBar1.Update;
end;

function TAcctTreeView.GetState:string;
begin
  Result:= StatusBar1.Panels[ 0 ].Text;
end;

procedure TAcctTreeView.SetPkTreeview(const Value: Boolean);
begin
  FPkTreeview := Value;
end;

procedure TAcctTreeView.SetState( const AValue:string );
begin
  StatusBar1.Panels[ 0 ].Text:= AValue;
  StatusBar1.Update;
end;

procedure TAcctTreeView.LoadTreeViewFromQuery;
begin
  ClearTreeView;
  LoadSubTreeViewFromQuery( QryAcct );
end;


procedure TAcctTreeView.LoadSubTreeViewFromQuery( AQuery: TFDQuery );
var
  sMajorType, sSubType, sUserType, sGLAcct:string;
  MajorTreeID, SubTypeTreeID, UserTypeTreeID, GLAcctNode : TUniTreeNode;
  hMsg: TPanelMesg;
begin
  try
     Changing:= TRUE;
     Status:= fin_rpt_rscstr.cTXT0000008; // 'Loading Accounts.  Please wait...';
     hMsg:= hPleaseWait(fin_rpt_rscstr.cTXT0000008);
     AQuery.Open;
     AQuery.First;
     BuildNodes(nil, 1, AQuery);
     DeleteEmptyNodes;
  finally
     Changing:= FALSE;
     Merging := FALSE;
     Status:= '';
     hMsg.Free;
  end;
end;

procedure TAcctTreeView.BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer; AQuery:TFDQuery);
var
  QryLevel   : Integer;
  cAcctType  : string;
  nId        : Real;
  nParentId  : Real;
  CurrentNode: TUniTreeNode;

  GLAcct_ID_field  : TField;
  GLAcct_field     : TField;
  GLAcct_Desc_field: TField;
  QryLevel_field   : TField;
begin
   with AQuery do
   begin
     GLAcct_ID_field  := FindField('GLACCT_ID');
     GLAcct_field     := FindField('ACCT');
     GLAcct_Desc_field:= FindField('ACCT_Descrip');
     QryLevel_field   := FindField('v_level');
     if not Assigned( QryLevel_field ) then
        QryLevel_field   := FindField('level');

     while not Eof do
     begin
       cAcctType := FieldByName('descrip').asString;
       QryLevel  := QryLevel_field.asInteger;
       nId       := FieldByName('id').asFloat;
       nParentId := FieldByName('parent_id').asFloat;

       {SAME LEVEL?}
       if QryLevel = TreeLevel then
       begin
         {No GLAcct.ID field}
         if not Assigned( GLAcct_ID_field )  then
            begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode := TreeView1.Items.AddChildObject( APrentNode,
                                                             cAcctType,
                                                             TFinCargo.Create( '', '', 0, nId, nParentId));
              AssignAccounts(CurrentNode, nId); }
            end

         {GLAcct_ID = 0 }
         else if GLAcct_ID_field.asFloat = 0 then
         begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode := TreeView1.Items.AddChildObject( APrentNode,
                                                             cAcctType,
                                                             TFinCargo.Create( FieldByName('heading').asString, FieldByName('footer').asString, 0, nId, nParentId));}
//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;

         end
         {No GLAcct.Acct, GLAcct.Descrip is linked in}
         else if not Assigned( GLAcct_field ) then
         begin
              CurrentNode:= AssignAccount( APrentNode,
                                           GLAcct_ID_field.asFloat,
                                           nId,
                                           nParentId,
                                           FieldByName('heading').asString,
                                           FieldByName('footer').asString,
                                           QryLevel );

//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;
         end

         {GLAcct.Acct, GLAcct.Descrip is linked in to speed up performance}
         else
         begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode:= TreeView1.Items.AddChildObject( APrentNode,
                                                            Format('[%s] %s', [ GLAcct_field.asString, GLAcct_Desc_field.asString ]),
                                                            TFinCargo.Create( FieldByName('heading').asString,
                                                                              FieldByName('footer').asString ,
                                                                              GLAcct_ID_field.asFloat,
                                                                              nId,
                                                                              nParentId)); }
//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;
         end;
         Next;
       end

       { RECURSIVE CALL }
       else if (QryLevel > TreeLevel) then
         BuildNodes(CurrentNode, TreeLevel + 1, AQuery)

       { EXIT }
       else
         Exit;
     end;
   end;  {with AQuery}
end;

function TAcctTreeView.AssignAccount(Node:TUniTreeNode; nGlAcctId, nId, nParentId:Real; Header, Footer:String; ALevel:Integer):TUniTreeNode;
begin
  //with TFDQuery.Create(self) do
  //try
  //  Connection := MainModule.FDConnection;
  //  Sql.Add(Format('select acct, descrip from glacct where id = %f', [nGLAcctId]));
  //  Open;
  //  Result := TreeView1.Items.AddChildObject( Node, Format('[%s] %s', [FieldByName('acct').asString, FieldByName('descrip').asString]),
  //                           TFinCargo.Create( Header, Footer, nGlAcctId, nId, nParentId));
  //finally
  //  Free;
  //end;

  with QryGLAcct do
  begin
    Filtered:= FALSE;
    Open;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
    if Locate('ID', nGlAcctId, []) then
       Result:= TreeView1.Items.AddChildObject( Node,
                                                Format('[%s] %s', [QryGLAcctACCT.asString, QryGLAcctDESCRIP.asString]),
                                                TFinCargo.Create( Header, Footer, nGlAcctId, nId, nParentId)); }
  end;
end;

procedure TAcctTreeView.AssignAccounts(Node:TUniTreeNode; nId:Real);
begin
  //with TFDQuery.Create(self) do
  //try
  //  Connection := MainModule.FDConnection;
  //  Sql.Add(Format('select id, acct, descrip from glacct where gl_subacct_type_id = %f order by acct', [ nId ]));
  //  Open;
  //  while not eof do
  //  begin
  //    TreeView1.Items.AddChildObject( Node, Format('[%s] %s', [FieldByName('acct').asString, FieldByName('descrip').asString]),
  //                           TFinCargo.Create( '', '', FieldByName('ID').asFloat, 0, 0));
  //    Next;
  //  end;
  //finally
  //  Free;
  //end;
  if not FPkTreeview then
  begin
    with QryGLAcct do
    begin
      Filtered:= TRUE;
      Filter  := Format('GL_SUBACCT_TYPE_ID = %.0f', [ nId ]);
      Open;
      First;
      while not Eof do
      begin
        { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
        TreeView1.Items.AddChildObject( Node,
                                        Format('[%s] %s', [QryGLAcctACCT.asString, QryGLAcctDESCRIP.asString]),
                                        TFinCargo.Create( '', '', QryGLAcctID.asFloat, 0, 0));  }
        Next;
      end;
    end;
  end
  else
  begin
//    if SelectValueFmtAsFloat('select count(id) from glacct where GL_SUBACCT_TYPE_ID = %f', [TFinCargo(Node.Data).sID]) <> 0 then
    TreeView1.Items.AddChild(Node, 'Tmp');
  end;
end;

procedure TAcctTreeView.DeleteEmptyNodes;
var
  ANode: TUniTreeNode;
  Tmp  : TUniTreeNode;
begin
  with TreeView1 do
  try
    Items.BeginUpdate;
    ANode:= Items.GetFirstNode;
    while Assigned( ANode ) do
    begin

      if Assigned(ANode.Data) and (TFinCargo(ANode.Data).AcctID = 0) and (not ANode.HasChildren) then
      begin
        TFinCargo( ANode.Data ).Free;
        { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
        Tmp:= ANode.GetNext;}
        { TODO -oathite -cWebConvert : Undeclared identifier: Delete
        ANode.Delete;}
        ANode:= Tmp;
      end
      else
        { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
        ANode:= ANode.GetNext; }
    end;
  finally
    Items.EndUpdate;
  end;
end;

function TAcctTreeView.GetNextNodeIDByParent( AParent:TUniTreeNode; const AType:string ):TUniTreeNode;
begin
  if Merging then
     Result:= FindNodeByName( AParent, AType );

  if not Merging or not Assigned(Result) then
     if Assigned(AParent) then
        Result:= TreeView1.Items.AddChild( AParent, AType )
     else
        Result:= TreeView1.Items.Add( AParent, AType );
end;

function TAcctTreeView.FindNodeByName( AParent:TUniTreeNode; const AType:string ):TUniTreeNode;
var
  ABrother: TUniTreeNode;
begin
  if not Assigned(AParent) then
     ABrother:= TreeView1.Items.GetFirstNode
  else
     ABrother:= AParent.GetFirstChild;

  Result:= NIL;
  while Assigned(ABrother) do with ABrother do
  begin
    if Trim(Text) = Trim(AType) then
    begin
      Result:= ABrother;
      EXIT;
    end;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNextSibling'
    ABrother:= ABrother.GetNextSibling;  }
  end;
end;

procedure TAcctTreeView.ClearTreeView;
var
  ANode    : TUniTreeNode;
  AOnChange: TTVChangedEvent;
begin
  with TreeView1 do
  try
    { TODO -oathite -cWebConvert : Incompatible types: 'TTreeNode' and 'TUniTreeNode in TTVChangedEvent'
    AOnChange:= OnChange; }
    OnChange := NIL;
    Items.BeginUpdate;
    ANode:= Items.GetFirstNode;
    while Assigned( ANode ) do
    begin
      if Assigned(ANode.Data) then
         TObject(ANode.Data).Free;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
      ANode:= ANode.GetNext;  }
    end;
    Items.Clear;
  finally
    { TODO -oathite -cWebConvert : Incompatible types: 'TTreeNode' and 'TUniTreeNode in TTVChangedEvent'
    OnChange:= AOnChange; }
    Items.EndUpdate;
  end;
end;

procedure TAcctTreeView.sbtnExpandClick(Sender: TObject);
begin
  with TreeView1 do
  begin
    FullExpand;
    Selected:= Items.GetFirstNode;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TopItem'
    TopItem := Selected;  }
  end;
end;

procedure TAcctTreeView.sbtnCollapseClick(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TAcctTreeView.MajorTypeProcess( Node:TUniTreeNode; DataSet:TDataSet  );
begin
end;

procedure TAcctTreeView.SubTypeProcess( Node:TUniTreeNode; DataSet: TDataSet  );
begin
end;

procedure TAcctTreeView.UserTypeProcess( Node:TUniTreeNode; DataSet: TDataSet  );
begin
end;

procedure TAcctTreeView.GLAcctProcess( Node:TUniTreeNode; DataSet: TDataSet  );
begin
//  Node.Data:= TFinCargo.Create( '',
//                                '',
//                                DataSet.FieldByName('glacct_id').asFloat);
end;

procedure TAcctTreeView.TreeView1GetImageIndex(Sender: TObject;
  Node: TUniTreeNode);
begin
  if Node.Data = nil then exit;
  with Node do
    if TFinCargo(Node.Data).AcctID <> 0 then
      begin
        ImageIndex    := 0;
        SelectedIndex := 0;
      end
      else if Node.Level <> 0 then
      begin
        ImageIndex    := 2;
        SelectedIndex := 2;
      end
      else
      begin
        ImageIndex    := 1;
        SelectedIndex := 1;
      end;
end;

procedure TAcctTreeView.TreeView1Collapsed(Sender: TObject;
  Node: TUniTreeNode);
begin
  TreeView1.RePaint;
end;

procedure TAcctTreeView.TreeView1Expanding(Sender: TObject; Node: TUniTreeNode;
  var AllowExpansion: Boolean);
var
  aNode, aNode2:TUniTreeNode;
  Afound:boolean;
begin
 QryGLAcct.Close;
 QryGLAcct.Open;
 Afound := false;
 aNode:= Node.getFirstChild;
 ANode2 := nil;
 if (aNode.Data = nil) then
 begin
//Now we know this is a "dummy" node and needs to be populated with child nodes
   aNode2 := ANode;
//   aNode.Delete; //Delete this dummy node
   Afound := true;
 end;
 while true do
 begin
   { TODO -oathite -cWebConvert : Undeclared identifier: 'getNextSibling'
   aNode:= aNode.getNextSibling; }
   if aNode = nil then break;
   if (aNode.Data = nil) then
   begin
     { TODO -oathite -cWebConvert : Undeclared identifier: 'Delete'
     aNode.Delete; //Delete this dummy node }
     Afound := true;
   end;
 end;
 if ANode2 <> nil then
   { TODO -oathite -cWebConvert : Undeclared identifier: 'Delete'
   ANode2.Delete;                                                  }
 if AFound then
   AssignAccounts2(Node, TFinCargo(Node.Data).sID);
 Screen.Cursor := crDefault;
end;

procedure TAcctTreeView.AssignAccounts2(Node:TUniTreeNode; nId:Real);
begin
  with QryGLAcct do
  begin
    Filtered:= TRUE;
    Filter  := Format('GL_SUBACCT_TYPE_ID = %.0f', [ nId ]);
    Open;
    First;
    while not Eof do
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
      TreeView1.Items.AddChildObject( Node,
                                      Format('[%s] %s', [QryGLAcctACCT.asString, QryGLAcctDESCRIP.asString]),
                                      TFinCargo.Create( '', '', QryGLAcctID.asFloat, 0, 0)); }
      Next;
    end;
  end;
  Screen.Cursor := crDefault;
end;


end.
