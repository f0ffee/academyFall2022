tableextension 50101 "TableExt50101" extends "Sales Line" //37
{
    fields
    {
        field(50100; "Fats"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50101; "Proteins"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50102; "Carbohydrates"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50103; "Total Calories"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        modify("No.")
        {
            trigger OnAfterValidate()
            var
                NutrInfo: Record "EOS Nutritional Information";
            begin
                if Type <> Type::Item then
                    exit;

                NutrInfo.SetRange("Item No.", Rec."No.");

                if NutrInfo.FindSet() then
                    repeat
                        case NutrInfo."Information Type" of
                            NutrInfo."Information Type"::Carbohydrates:
                                Rec.Carbohydrates := NutrInfo.Amount;

                            NutrInfo."Information Type"::Proteins:
                                Rec.Proteins := NutrInfo.Amount;

                            NutrInfo."Information Type"::Fats:
                                Rec.Fats := NutrInfo.Amount;

                            else
                                OnInfoTypeCaseOnAfterValidate(Rec, NutrInfo); //richiamo l'evento
                        end;

                        Rec."Total Calories" += NutrInfo."Calories Count";

                    until NutrInfo.Next() = 0;
            end;
        }
    }

    //scrivo l'evento dato che il codice è estendibile quindi nel caso l'utente abbia creato personalizzazioni, se li possa gestire lui.
    [IntegrationEvent(false, false)]
    local procedure OnInfoTypeCaseOnAfterValidate(
        var Rec: Record "Sales Line";
        NutrInfo: Record "EOS Nutritional Information"
    )
    begin

    end;

}