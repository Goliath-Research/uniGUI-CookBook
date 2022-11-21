unit Demo_VCL_DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmDemoVCL = class(TDataModule)
    Persons: TFDMemTable;
    Cars: TFDMemTable;
    PersonsId: TAutoIncField;
    PersonsFirstName: TStringField;
    PersonsLastName: TStringField;
    PersonsFullName: TStringField;
    PersonsBirthDate: TDateTimeField;
    PersonsAge: TIntegerField;
    Sexes: TFDMemTable;
    SexesId: TIntegerField;
    SexesSex: TStringField;
    PersonsSexId: TIntegerField;
    PersonsSex: TStringField;
    CarsId: TAutoIncField;
    CarsCar: TStringField;
    CarsPersonId: TIntegerField;
    dsPersons: TDataSource;
    dsCars: TDataSource;
    procedure PersonsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDemoVCL: TdmDemoVCL;

implementation

uses
    DateUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDemoVCL.PersonsCalcFields(DataSet: TDataSet);
var
    s : string;
begin
    // FullName = FirstName + ' ' + LastName
    if not PersonsFirstName.IsNull then
        s := PersonsFirstName.AsString;
    if not PersonsLastName.IsNull then
    begin
        if s <> '' then
            s := s + ' ';
        s := s + PersonsLastName.AsString
    end;
    PersonsFullName.AsString := s;

    // Age = Years(Now - BirthDate)

    if PersonsBirthDate.IsNull then
        PersonsAge.Clear
    else
        PersonsAge.Value := Now.YearsBetween(PersonsBirthDate.Value)
end;

end.
