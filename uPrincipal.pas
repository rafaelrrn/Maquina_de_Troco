unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    edt_vrTroco: TEdit;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure edt_vrTrocoExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uMaquina, uTroco;

procedure TForm1.Button1Click(Sender: TObject);
var
   maquina    : TMaquina;
   lTroco     : TList;
   I          : Integer;
   msg,descTroco : String;
begin

   if edt_vrTroco.Text = EmptyStr then
      exit;

   maquina  := TMaquina.Create;

   try
      lTroco := maquina.MontarTroco(StrToFloat(edt_vrTroco.Text));

      for I := 0 to lTroco.Count - 1 do
      begin

         if not (TTroco(lTroco[I]).Tipo in [ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1]) then
            descTroco := ' nota(s) de '
         else
            descTroco := ' moeda(s) de ';


         msg := msg + TTroco(lTroco[I]).QuantidadeTroco.ToString +  descTroco + TTroco(lTroco[I]).VrNota.toStringFormatado +
                ' - TTroco(' + TTroco(lTroco[I]).CedulaNome + ','+ TTroco(lTroco[I]).QuantidadeTroco.ToString + ')'+ #13#10;
      end;

   finally

      if msg <> EmptyStr then
         showMessage(msg);

      maquina.Free;
      lTroco.Clear;
      lTroco.Free;
      descTroco := '';
      msg       := '';
   end;


end;

procedure TForm1.edt_vrTrocoExit(Sender: TObject);
var
  TextOnEdit: UnicodeString;
  Value: Currency;
begin

     TextOnEdit := TEdit(Sender).Text;

     if TryStrToCurr(TextOnEdit, Value) then
           TEdit(Sender).Text := FormatFloat('#.##', Value)
     else
           TEdit(Sender).Text := '0,00';
end;



end.
