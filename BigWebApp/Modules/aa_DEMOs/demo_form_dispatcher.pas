{*******************************************************}
{ Temporary unit:                                       }
{  demo_form_dispatcher.pas                             }
{ Purpose:                                              }
{  Used to display TUniForms not yet compatible with    }
{  the TUniFrame/dependency injection framework         }
{*******************************************************}
unit demo_form_dispatcher;

interface

uses
  //all units added for demo must be added to /modules/aa_DEMOs folder
  demo_salesorders;

  (*List of modules that should override the dependency injection
    framework for sole purpose of sales demo *)
  type
    tDemoModule = (demoNone,
                   demoSales //Sales Orders
                  );

  function CheckExecuteDemo( AStrParam1 : String ) : Boolean;

implementation

  function CheckExecuteDemo( AStrParam1 : String ) : Boolean;
  var
    aDemoModule : tDemoModule;
  begin
    Result:= False;
    aDemoModule := demoNone;

    if AStrParam1 = 'Sales Orders' then
      aDemoModule := demoSales;
    //else if...
    //aDemoModule := demoXXX

    if aDemoModule <> demoNone then
    begin
      Result := True;

      case aDemoModule of
        demoNone  : ;
        demoSales : TFrmMainOrder.DoShow;
        //demoXXX....
      end;
    end;

  end;

end.
