tableextension 50101 "TableExt50101" extends "Sales Line" // 37
{
    fields
    {
        field(50100; "Fats"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50101; "Protein"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50102; "Carbohydrates"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50103; "Total Calories"; Integer)
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

                            NutrInfo."Information Type"::Protein:
                                Rec.Protein := NutrInfo.Amount;

                            NutrInfo."Information Type"::Fats:
                                Rec.Fats := NutrInfo.Amount;

                            else
                                OnInfoTypeCaseOnAfterValidate(Rec, NutrInfo);
                        end;

                        Rec."Total Calories" += NutrInfo."Calorie Count";
                    // Rec."Total Calories" := Rec."Total Calories" + NutrInfo."Calorie Count";
                    until NutrInfo.Next() = 0;
            end;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnInfoTypeCaseOnAfterValidate(
        var Rec: Record "Sales Line";
        NutrInfo: Record "EOS Nutritional Information"
    )
    begin
    end;
}