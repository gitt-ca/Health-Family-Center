program healthh;

uses
  Vcl.Forms,
  Healthpas in 'Healthpas.pas' {Form2},
  Cadastro in 'Cadastro.pas' {Form3},
  Principal in 'Principal.pas' {Form4},
  TelaAgendamento in 'TelaAgendamento.pas' {Form5},
  TelaCadPaciente in 'TelaCadPaciente.pas' {Form6},
  TelaCadMedic in 'TelaCadMedic.pas' {Form7},
  HistoricoPaciente in 'HistoricoPaciente.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  //Application.CreateForm(TFormCadAgendamento, FormCadAgendamento);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
