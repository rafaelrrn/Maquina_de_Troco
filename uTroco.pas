unit uTroco;

interface

type

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2, ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

  TTroco = class

  private
    FTipo: TCedula;
    FQuantidade: Integer;
    FCedulaNome: String;
    FVrNota : Double;
    FQuantidadeTroco: Integer;
    procedure SetQuantidadeTroco(const Value: Integer);

  public
    constructor Create(aTipo: TCedula; aQuantidade: Integer);

	
    property Tipo: TCedula read FTipo;
    property QuantidadeTotal: Integer read FQuantidade write FQuantidade;
    property QuantidadeTroco: Integer read FQuantidadeTroco write SetQuantidadeTroco;
    property CedulaNome : String  read FCedulaNome;
    property VrNota : Double read FVrNota;
  end;

const
  CValorCedula: array [TCedula] of Double = (100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05, 0.01);
  CNomeCedula: array  [TCedula] of String = ('ceNota100', 'ceNota50', 'ceNota20', 'ceNota10', 'ceNota5',
                                             'ceNota2', 'ceMoeda100', 'ceMoeda50', 'ceMoeda25', 'ceMoeda10',
                                             'ceMoeda5','ceMoeda1');

implementation

constructor TTroco.Create(aTipo: TCedula; aQuantidade: Integer);
begin
  inherited Create;

  FTipo            := aTipo;
  FQuantidade      := aQuantidade;
  FCedulaNome      := CNomeCedula[FTipo];
  FVrNota          := CValorCedula[FTipo];
  FQuantidadeTroco := 0;
end;



procedure TTroco.SetQuantidadeTroco(const Value: Integer);
begin
  FQuantidadeTroco := Value;
end;

end.

