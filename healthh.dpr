program healthh;

uses
  Vcl.Forms,
  Healthpas in 'Healthpas.pas' {Form2},
  Cadastro in 'Cadastro.pas' {Form3},
  Principal in 'Principal.pas' {Form4},
  DataModel in 'DataModel.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDataModule2, DataModule2);
  //Application.CreateForm(TFormCadAgendamento, FormCadAgendamento);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
