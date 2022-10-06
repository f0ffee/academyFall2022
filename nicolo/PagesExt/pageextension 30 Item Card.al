pageextension 50101 "PageExt50101" extends "Item Card" //30
{
    layout
    {
        addafter(Description)
        {
            group(TotalCalories)
            {
                ShowCaption = false; //nascondo il gruppo
                Visible = IsFood;

                field("Total Calories"; Rec."Total Calories")
                {
                    ApplicationArea = All;
                }
            }
        }

        addafter(ItemPicture)
        {
            part(NutrInfoFactBox; "EOS Nutr. Info. Factbox")
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
                Caption = 'Add Macros';
                Image = CalculateDiscount;

                ApplicationArea = All;

                trigger OnAction()
                var
                    NutrInfo: Record "EOS Nutritional Information";
                    InfoType: Enum "EOS Information Type";

                begin
                    foreach InfoType in Enum::"EOS Information Type".Ordinals() do
                        if InfoType.AsInteger() <> 0 then begin
                            NutrInfo.Init();
                            // NutrInfo."Item No." := rec."No.";
                            NutrInfo.Validate("Item No.", Rec."No."); // prima di inserire il record, esegui l'OnValidate
                            NutrInfo.Validate("Information Type", InfoType);
                            if not NutrInfo.Insert() then
                                Clear(NutrInfo);
                        end;

                    CurrPage.Update();//refresho la pagina
                end;
            }
        }
    }

    var
        IsFood: Boolean;

    trigger OnOpenPage() //controlla quando carichi la pagina

    var
        NutrInfo: Record "EOS Nutritional Information";

    begin
        NutrInfo.SetRange("Item No.", Rec."No.");
        if not NutrInfo.IsEmpty then
            IsFood := true;
    end;


    trigger OnAfterGetRecord()//controlla quando carichi un nuovo record
    var
        NutrInfo: Record "EOS Nutritional Information";
    begin
        NutrInfo.SetRange("Item No.", Rec."No.");
        if not NutrInfo.IsEmpty then
            IsFood := true;
    end;
}