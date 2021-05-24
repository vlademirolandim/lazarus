unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids,
  ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ZConnection1AfterConnect(Sender: TObject);
begin

end;

end.

