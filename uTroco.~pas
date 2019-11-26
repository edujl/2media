unit uTroco;

interface

type

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2,
    ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

  TTroco = class
  private
    FTipo: TCedula;
    FQuantidade: Integer;
  public
    constructor Create(aTipo: TCedula; aQuantidade: Integer);

    property Tipo: TCedula read FTipo;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

  function RetornaTipo(cedula: TCedula): string;

const
        CValorCedula: array [TCedula] of Double = (100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05, 0.01);

implementation

function RetornaTipo(cedula: TCedula): string;
begin
        Result := 'moeda';
        if cedula in [ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2] then
                Result := 'nota';
        end;

constructor TTroco.Create(aTipo: TCedula; aQuantidade: Integer);
begin
        inherited Create;
        FTipo := aTipo;
        FQuantidade := aQuantidade;
end;

end.
