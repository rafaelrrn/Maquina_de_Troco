unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, System.Generics.Collections, System.SysUtils;

type

  TDoubleHelper = record helper for double
    function toInteger: Integer;
    function obterSobra: Integer;
    function toCentavos: Integer;
    function toStringFormatado : String;
  end;

  TMaquina = class(TInterfacedObject, IMaquina)

  private
    FTrocoDisponivel : TObjectDictionary<TCedula, TTroco>;

    procedure CarregaTrocoDisponivel;
    function AdicionaTroco(troco: TTroco): Boolean;
    function RetornaCedulaTroco(cedula : TCedula; troco: TTroco): TTroco;
  published

    constructor Create;
    Destructor Destroy; override;

  public

    function MontarTroco(aTroco: Double): TList;

  end;

implementation

uses
  Vcl.Dialogs;



function TMaquina.AdicionaTroco(troco: TTroco): Boolean;
begin
   try
      Result := true;
      FTrocoDisponivel.AddOrSetValue(troco.Tipo, troco);

   except
      Result := false;
   end;
end;

procedure TMaquina.CarregaTrocoDisponivel;
var
   troco : TTroco;
   I     : Integer;
begin
   for I := 0 to Length(CValorCedula) - 1 do
   begin
      troco :=  TTroco.Create(TCedula(I),random(30));
      AdicionaTroco(troco);
   end;

   FTrocoDisponivel.TrimExcess;
end;

constructor TMaquina.Create;
begin
   if not Assigned(FTrocoDisponivel) then
      FTrocoDisponivel := TObjectDictionary<TCedula, TTroco>.Create([doOwnsValues]);

   CarregaTrocoDisponivel;
end;

destructor TMaquina.Destroy;
begin
   FreeAndNil(FTrocoDisponivel);
  inherited;
end;

function TMaquina.MontarTroco(aTroco: Double): TList;
var
   qntdCedulaDisponiveis,
   I, qntdNotasTroco,
   vrMoedas : Integer;

   listaTroco : TList;
   vtroco     : TTroco;

begin
   try
      vtroco := nil;
      listaTroco := nil;

      if not(Assigned(listaTroco)) then
         listaTroco := TList.Create
      else
         listaTroco.Clear;

      if aTroco = 0 then
         exit;

      vrMoedas := aTroco.obterSobra;
      aTroco   := Int(aTroco);

      //Notas
      while aTroco > 0 do
      begin

         for I := 0 to Length(CValorCedula) - 1 do
         begin
            vtroco := RetornaCedulaTroco(TCedula(I),vtroco);

            if assigned(vtroco) then
            begin
               qntdCedulaDisponiveis := vtroco.QuantidadeTotal;

               qntdNotasTroco := (aTroco.toInteger div vtroco.VrNota.toInteger);

               if qntdNotasTroco <> 0 then
               begin

                  vtroco.QuantidadeTroco := qntdNotasTroco;
                  listaTroco.Add(vtroco);
                  aTroco := (aTroco.toInteger mod vtroco.VrNota.toInteger);

               end;

            end;

            if aTroco = 0 then
               break;
         end;

      end;

      //Moedas
      while vrMoedas > 0 do
      begin

         for I := 0 to Length(CValorCedula) - 1 do
         begin
            vtroco := RetornaCedulaTroco(TCedula(I),vtroco);

            if assigned(vtroco) then
            begin

               if not (vtroco.Tipo in [ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1]) then
                  continue;

               qntdCedulaDisponiveis := vtroco.QuantidadeTotal;

               qntdNotasTroco := (vrMoedas div vtroco.VrNota.toCentavos);

               if qntdNotasTroco <> 0 then
               begin

                  vtroco.QuantidadeTroco := qntdNotasTroco;
                  listaTroco.Add(vtroco);
                  vrMoedas := (vrMoedas mod vtroco.VrNota.toCentavos);

               end;

            end;

            if vrMoedas = 0 then
               exit;
         end;

      end;

   finally
      result := listaTroco;

      qntdCedulaDisponiveis := 0;
      qntdNotasTroco        := 0;
   end;
end;

function TMaquina.RetornaCedulaTroco(cedula: TCedula; troco: TTroco): TTroco;
begin
   try
      if FTrocoDisponivel.ContainsKey(cedula) then
         FTrocoDisponivel.TryGetValue(cedula, troco);

   finally
      result := troco;
   end;
end;

{ TDoubleHelper }

function TDoubleHelper.obterSobra: Integer;
begin
   Result := round(frac(Self) * 100);
end;

function TDoubleHelper.toCentavos: Integer;
begin
   Result := round(Self * 100);
end;

function TDoubleHelper.toInteger: Integer;
var
  resto : integer;
begin
   Result := Trunc(Self)
end;

function TDoubleHelper.toStringFormatado: String;
begin
   result := FormatFloat('R$ ###,##0.00', Self);
end;

end.

