unit IQWebHPick;

interface

uses
  Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Generics.Collections,
  PickListDlg,
  DB;

type

  TIQWebHPick = class(TComponent)
    protected
      FTitle    : string;
      FDataSet  : TFDDataSet;

      procedure SetTitle(const Value: string);
    public
      procedure DoSinglePickList  (aID : integer;        aCallBack: TSinglePickListCallBack);
      procedure DoMultiplePickList(aIDs: TList<integer>; aCallBack: TMultiplePickListCallBack);
    published

      property Title    : string      read FTitle   write SetTitle;
      property DataSet  : TFDDataSet  read FDataSet write FDataSet;
  end;

implementation

uses
  SysUtils,
  StrUtils;

procedure TIQWebHPick.DoSinglePickList(aID: integer; aCallBack: TSinglePickListCallBack);
begin
  PickListDlg.DoSinglePickList(DataSet, aID, aCallBack);
end;

procedure TIQWebHPick.DoMultiplePickList(aIDs: TList<integer>; aCallBack: TMultiplePickListCallBack);
begin
  PickListDlg.DoMultiplePickList(DataSet, aIDs, aCallBack);
end;

procedure TIQWebHPick.SetTitle(const Value: string);
var
  I: Integer;
begin
  FTitle:= Value;

  I:= Pos('picklist', LowerCase(FTitle));

  if I > 0 then
  begin
    if FTitle[ I ] = 'P' then  // ensure upper case when spelled Picklist -> PickList
       FTitle[ I+4 ]:= 'L';
    FTitle:= StuffString( FTitle, I+4, 0, ' ' );
  end;
end;

end.
