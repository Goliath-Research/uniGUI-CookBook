unit Registration;

interface

uses
  Spring.Container;

  procedure RegisterTypesForDesktop(Container : TContainer);
  procedure RegisterTypesForMobile (Container : TContainer);

implementation

uses
  SpringExtension,
  UniGUIApplication,
  MainModule,
  Interfaces,
  _dUsersForm, _mUsersForm,
  _dOrdersForm, _mOrdersForm,
  _dSalesReportForm, _mSalesReportForm;

procedure RegisterTypesForDesktop(Container : TContainer);
begin
  Container.
    RegisterType<TdUsersForm>.
    Implements<IUsersEditorForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
//    InjectProperty('OnCreate', @TdUsersForm.UniFormCreate).
    AsCustom<TCustomLifetimeManager>;

  Container.
    RegisterType<TdOrdersForm>.
    Implements<IOrdersEditorForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsCustom<TCustomLifetimeManager>;

  Container.
    RegisterType<TdSalesReportForm>.
    Implements<ISalesReportForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsCustom<TCustomLifetimeManager>;

  Container.Build;
end;

procedure RegisterTypesForMobile(Container : TContainer);
begin
  Container.
    RegisterType<TmUsersForm>.
    Implements<IUsersEditorForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsCustom<TCustomLifetimeManager>;

  Container.
    RegisterType<TmOrdersForm>.
    Implements<IOrdersEditorForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsCustom<TCustomLifetimeManager>;

  Container.
    RegisterType<TmSalesReportForm>.
    Implements<ISalesReportForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsCustom<TCustomLifetimeManager>;

  Container.Build;
end;

end.
