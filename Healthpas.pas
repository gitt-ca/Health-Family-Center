unit Healthpas;

  interface
    uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    Vcl.Imaging.pngimage;
  type
  TForm2 = class(TForm)
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    pnlLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ediUser: TEdit;
    edtPass: TEdit;
    Button1: TButton;
    btnCadastro: TButton;
    procedure btnCadastroClick(Sender: TObject);

  private

  public

  end;
  var
  Form2 : TForm2;

  implementation

  {$R *.dfm}

    uses
      Cadastro;

  procedure TForm2.btnCadastroClick(Sender: TObject);
    begin
    Form3:= TForm3.Create(nil);
    try
      Form3.ShowModal;
    finally
        FreeAndNil(Form3);
    end;
    end;

end.