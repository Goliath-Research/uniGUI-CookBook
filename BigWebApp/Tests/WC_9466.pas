unit WC_9466;

interface

implementation

uses
  TestReg,
  System.UITypes,
  System.Variants,
  Data.DB,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  uniGUIApplication,
  SysUtils,
  uniGUIDialogs,
  UserInputParameters;

procedure Test1;
var
  Qry: TDataSet;
  IDS: IIQDataServices;
  ID: integer;
  LPrms: TInputParameters;
begin
  { Get the ID from user }
  LPrms := UserInputParameters.GetParamValue(['EPlant ID'], [ftFloat], [4],
    'Select from Pick List');
  try
    IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

    Qry := IDS.GetQuery('select ID, Name from eplant');
    try
      Qry.Open;

      ID := DoSinglePickList(Qry, LPrms.ValueByName['EPLANT ID']);

      ShowMessage('ID = ' + IntToStr(ID));
    finally
      Qry.Free;
    end;
  finally
    LPrms.Free;
  end;
end;

procedure Test2;
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  lst : IList<integer>;
  ID  : integer;
  str : string;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select ID, Name from eplant');
  try
    Qry.Open;

    lst := DoMultiplePickList(Qry, nil);

    str := '';
    if Assigned(lst) then
      for ID in lst do
        str := str + IntToStr(ID) + ' ';

    ShowMessage('IDs = ' + str);
  finally
    Qry.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-9466', 'IQWebVcl', 'TPickListForm', 'DoSinglePickList'  , Test1, 1);
  TTestRepo.RegisterTest('WC-9466', 'IQWebVcl', 'TPickListForm', 'DoMultiplePickList', Test2, 2);

end.
