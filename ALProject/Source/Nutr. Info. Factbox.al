page 50101 "EOS Nutr. Info. Factbox"
{
    ApplicationArea = All;
    Caption = 'Nutritional Information Factbox';
    PageType = CardPart;
    SourceTable = "EOS Nutritional Information";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Information Type"; Rec."Information Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}