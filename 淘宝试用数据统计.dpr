program 淘宝试用数据统计;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uShowPic in 'uShowPic.pas' {frmPic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPic, frmPic);
  Application.Run;
end.
