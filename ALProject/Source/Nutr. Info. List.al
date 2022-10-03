page 50100 "EOS Nutr. Info. List"
{
    ApplicationArea = All;
    Caption = 'Nutritional Information';
    PageType = List;
    SourceTable = "EOS Nutritional Information";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName) // group -> card, repeater -> list
            {
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