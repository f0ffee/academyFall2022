pageextension 50101 "PageExt50101" extends "Item Card" // 30
{
    layout
    {
        addafter(Description)
        {
            group(TotalCalories)
            {
                ShowCaption = false;
                Visible = IsFood;

                field("Total Calories"; Rec."Total Calories")
                {
                    ApplicationArea = All;
                }
            }
        }

        addafter(ItemPicture)
        {
            part(NutrInfoFactbox; "EOS Nutr. Info. Factbox")
            {
                SubPageLink = "Item No." = field("No.");
                Visible = IsFood;
            }
        }
    }

    actions
    {
        addlast(Functions)
        {
            action(InitNutrInfo)
            {
                ApplicationArea = All;
                Caption = 'Add Macros';
                Image = Add;

                trigger OnAction()
                var
                    NutrInfo: Record "EOS Nutritional Information";
                    InfoType: Enum "EOS Information Type";
                begin
                    foreach InfoType in Enum::"EOS Information Type".Ordinals() do
                        if InfoType.AsInteger() <> 0 then begin
                            // NutrInfo.Init();
                            // NutrInfo."Item No." := Rec."No.";
                            NutrInfo.Validate("Item No.", Rec."No.");
                            NutrInfo.Validate("Information Type", InfoType);
                            if not NutrInfo.Insert() then
                                Clear(NutrInfo);
                        end;

                    CurrPage.Update();
                end;
            }
        }
    }

    var
        IsFood: Boolean;

    trigger OnOpenPage()
    begin
        CheckIsFood();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CheckIsFood();
    end;

    trigger OnAfterGetRecord()
    begin
        CheckIsFood();
    end;

    local procedure CheckIsFood()
    var
        NutrInfo: Record "EOS Nutritional Information";
    begin
        NutrInfo.SetRange("Item No.", Rec."No.");
        if not NutrInfo.IsEmpty then
            IsFood := true;
    end;
}