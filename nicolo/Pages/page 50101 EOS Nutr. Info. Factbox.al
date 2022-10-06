page 50101 "EOS Nutr. Info. Factbox"
{
    Caption = 'Nutritional Info Factbox';
    PageType = CardPart;
    // ApplicationArea = All;
    // UsageCategory = Lists;
    SourceTable = "EOS Nutritional Information";

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

                field("Amount"; Rec."Amount")
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
                Image = AboutNav;
                // RunObject = page "EOS Nutr. Info. Card";
                // RunPageOnRec = true;

                trigger OnAction() // al posto del codice soprastante 'RunObject', posso usare questo codice qua sotto
                var
                    NutrInfo:Record "EOS Nutritional Information";
                    NutrInfoCard:Page "EOS Nutr. Info. Card";
                begin
                    NutrInfo.Get(Rec."Item No.",Rec."Information Type");
                    NutrInfoCard.SetRecord(NutrInfo);
                    NutrInfoCard.Run();
                end;

            }
        }
    }
}