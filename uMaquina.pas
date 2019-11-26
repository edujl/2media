unit uMaquina;

interface

uses
  uIMaquina, uTroco, Classes;

type

        TMaquina = class(TInterfacedObject, IMaquina)
        private
                procedure MontarTrocoAux(aLista: TList; aValor: Integer; aInteiro: Boolean);
        public
                function MontarTroco(aTroco: Double): TList;
        end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var
        inteiro, decimal: Integer;
begin
        Result := TList.Create;
        inteiro := Trunc(aTroco);
        decimal := Round(Frac(aTroco) * 100);
        MontarTrocoAux(Result, inteiro, True);
        MontarTrocoAux(Result, decimal, False);
end;

procedure TMaquina.MontarTrocoAux(aLista: TList; aValor: Integer; aInteiro: Boolean);
var
        aux, valor: Integer;
        cedula: TCedula;
        troco: TTroco;
begin
        if aInteiro then
        begin
                for cedula := ceNota100 to ceMoeda100 do
                begin
                        valor := Trunc(CValorCedula[cedula]);
                        aux := aValor div valor;
                        aValor := aValor - aux * valor;
                        if aux > 0 then
                        begin
                                troco := TTroco.Create(cedula, aux);
                                aLista.Add(troco);
                        end;
                end;
        end
        else
        begin
                for cedula := ceMoeda50 to ceMoeda1 do
                begin
                        valor := Trunc(CValorCedula[cedula] * 100);
                        aux := aValor div valor;
                        aValor := aValor - aux * valor;
                        if aux > 0 then
                        begin
                                troco := TTroco.Create(cedula, aux);
                                aLista.Add(troco);
                        end;
                end;
        end;
        end;
end.

