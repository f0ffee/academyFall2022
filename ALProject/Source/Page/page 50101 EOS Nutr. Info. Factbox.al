page 50101 "EOS Nutr. Info. Factbox"
{
    // ApplicationArea = All;
    Caption = 'Nutritional Information Factbox';
    PageType = CardPart;
    SourceTable = "EOS Nutritional Information";
    // UsageCategory = Lists;

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

    actions
    {
        area(Processing)
        {
            action(NutrInfoCard)
            {
                ApplicationArea = All;
                Caption = 'Card';
                RunObject = page "EOS Nutr. Info. Card";
                RunPageOnRec = true;

                // trigger OnAction()
                // var
                //     NutrInfo: Record "EOS Nutritional Information";
                //     NutrInfoCard: Page "EOS Nutr. Info. Card";
                // begin
                //     NutrInfo.Get(Rec."Item No.", Rec."Information Type");
                //     NutrInfoCard.SetRecord(NutrInfo);
                //     NutrInfoCard.Run();
                // end;
            }
        }
    }
}