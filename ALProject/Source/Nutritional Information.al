table 50100 "EOS Nutritional Information"
{
    Caption = 'Nutritional Information';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
        }
        field(2; "Information Type"; Enum "EOS Information Type")
        {
            DataClassification = CustomerContent;
        }
        field(3; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                case "Information Type" of
                    "Information Type"::Fats:
                        "Calorie Count" := Round(Amount * 9, 1);
                    "Information Type"::Carbohydrates, "Information Type"::Protein:
                        "Calorie Count" := Round(Amount * 4, 1);
                end;
            end;
        }
        field(4; "Calorie Count"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Item No.", "Information Type")
        {
            Clustered = true;
        }
    }
}