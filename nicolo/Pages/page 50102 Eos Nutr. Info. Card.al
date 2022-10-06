page 50102 "EOS Nutr. Info. Card"
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Lists;
    SourceTable = "EOS Nutritional Information";

    layout
    {
        area(Content)
        {
            group(NutrInfoData)
            {
                Caption = 'Nutritional Information';
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                }

                field("Information Type"; Rec."Information Type")
                {
                    ApplicationArea = All;

                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                }

                field("Calories Count"; Rec."Calories Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}