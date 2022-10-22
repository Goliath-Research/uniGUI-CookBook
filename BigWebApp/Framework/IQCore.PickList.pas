unit IQCore.PickList;

interface

uses
  Classes,
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQPickLists = class(TIQObjs<IIQPickList>, IIQPickLists)
  end;

  TIQPickList = class(TIQNamedObj, IIQPickList)
  private
    function  GetListItems : IList<IIQPickListItem>;
    function  GetAsStrings : TStrings;
  public
    procedure Load(aDataSet : TDataSet = nil); override;
    procedure Save(aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;

    function  AddListItem   (aPickListID : integer; aText : string) : integer;
    procedure DelListItem   (aListItemID : integer);
    procedure UpdListItem   (aListItemID : integer; aText : string; aSeq : integer);
    procedure SetListItemPos(aListItemID : integer; aPos, aDelta : integer);
  end;

implementation

uses
  SysUtils,
  Math,
  MainModule,
  System.Generics.Defaults,
  IQCore.PickList.Item;

{ TIQPickList }

function TIQPickList.AddListItem(aPickListID: integer; aText: string): integer;
var
  li : IIQPickListItem;
begin
  li := TIQListItem.Create;
  li.Text := aText;
  li.ParentID := aPickListID;

  li.Save(nil);
  Result := li.ID;
end;

procedure TIQPickList.DelListItem(aListItemID: integer);
begin
  TIQListItem.DelListItem(aListItemID);
end;

function TIQPickList.GetAsStrings: TStrings;
var
  sl : TStringList;
  ic : IComparer<integer>;
begin
  sl := TStringList.Create;
  try
    ic := TComparer<integer>.Default;
    GetListItems.
      Ordered(
        function(const left, right : IIQPickListItem) : integer
        begin
          Result := ic.Compare(left.Seq, right.Seq);
        end
      ).
      ForEach(
        procedure(const li : IIQPickListItem)
        begin
          sl.AddObject(li.Text, TObject(pointer(li.ID)));
        end
      );
  finally
    Result := sl;
  end;
end;

function TIQPickList.GetListItems: IList<IIQPickListItem>;
begin
  Result := TIQListItem.GetListItems(GetID);
end;

procedure TIQPickList.Load(aDataSet: TDataSet = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickListDS;

  inherited Load(aDataSet);
end;

procedure TIQPickList.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickListDS;

  inherited Save(aDataSet);
end;

procedure TIQPickList.SetListItemPos(aListItemID, aPos, aDelta : integer);
var
  CurrPos : integer;
  NewPos  : integer;
begin
  CurrPos := 0;
  NewPos  := aPos + aDelta;
  GetListItems.
    ForEach(
      procedure(const pli : IIQPickListItem)
      begin
        Inc(CurrPos);

        if pli.ID = aListItemID then
          pli.Seq := NewPos
        else
          if CurrPos = NewPos then
            pli.Seq := aPos
          else
            pli.Seq := CurrPos;

        pli.Save(nil);
      end
    );
end;

procedure TIQPickList.UpdListItem(aListItemID: integer; aText: string; aSeq: integer);
begin
  TIQListITem.UpdListItem(aListItemID, aText, aSeq);
end;

end.
