table 50100 "EOS Nutritional Information"
{
    Caption = 'Nutritional Information List';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No."; // indica se il campo rappresenta la chiave di un altra tabella.
        }

        field(2; "Information Type"; Enum "EOS Information Type")
        {
            DataClassification = CustomerContent;
        }

        field(3; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 1; //numero di cifre di partenza a numero di arrivo

            trigger OnValidate()
            begin
                case "Information Type" of
                    "Information Type"::Fats:
                        "Calories Count" := Round(Amount * 9, 1);
                    "Information Type"::Carbohydrates, "Information Type"::Proteins:
                        "Calories Count" := Round(Amount * 4, 1);
                end;
            end;
        }

        field(4; "Calories Count"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
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