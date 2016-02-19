library ScanProj;

uses
  ComServ,
  ScanProj_TLB in 'ScanProj_TLB.pas',
  ScanImpl in 'ScanImpl.pas' {ScanX: TActiveForm} {ScanX: CoClass},
  cropUnit in 'cropUnit.pas' {cropForm};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
