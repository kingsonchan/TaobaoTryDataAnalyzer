program 淘宝试用数据统计;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uShowPic in 'uShowPic.pas' {frmPic},
  fTextButton in 'fTextButton.pas' {FrameTextButton: TFrame},
  uAnswer in 'uAnswer.pas' {frmAnswer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPic, frmPic);
  Application.CreateForm(TfrmAnswer, frmAnswer);
  Application.Run;
end.
