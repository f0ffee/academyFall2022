page 50102 "EOS Nutr. Info. Card"
{
    PageType = Card;
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
                field("Calorie Count"; Rec."Calorie Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}