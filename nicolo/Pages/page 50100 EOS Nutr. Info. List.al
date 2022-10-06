page 50100 "EOS Nutr. Info. List"
{
    Caption = 'Nutritional Information List';
    CardPageId="EOS Nutr. Info. Card";
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "EOS Nutritional Information";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                field("Calories Count"; Rec."Calories Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}