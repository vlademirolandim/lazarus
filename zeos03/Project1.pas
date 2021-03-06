program Project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, zcomponent, CustApp, Unit1, Interfaces, ZConnection
  { you can add units after this };

{
https://forum.lazarus.freepascal.org/index.php?topic=7143.0
Adicione Interfaces à sua cláusula de usos (antes de Formulários).
}

type

  { TMyApplication }

  TMyApplication = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TMyApplication }

procedure TMyApplication.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  DataModule1.ZQuery1.Open;
  writeln( DataModule1.ZQuery1.FieldByName('first_name').Value );
  DataModule1.ZQuery1.Next;
  writeln( DataModule1.ZQuery1.FieldByName('first_name').Value );


  readln;

  // stop program loop
  Terminate;
end;

constructor TMyApplication.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TMyApplication.Destroy;
begin
  inherited Destroy;
end;

procedure TMyApplication.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TMyApplication;
begin

  Application:=TMyApplication.Create(nil);
  Application.Create( Datamodule1);
  Datamodule1 := TDataModule1.Create(nil);

  Application.Title:='My Application';
  Application.Run;
  Application.Free;
end.

