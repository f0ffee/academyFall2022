pageextension 50150 "PageExt50150" extends "Item List" //31
{
    layout
    {
        addafter(Description)
        {

            field("Reversed Description"; Rec."Reversed Description")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        addlast(Functions)
        {
            action(Reverse)
            {
                ApplicationArea = All;
                Caption = 'Reverse Description';
                Promoted = true;
                PromotedCategory = Report;
                Image = Action;
                trigger OnAction()
                var
                    Item: Record Item;
                    Desc: Text[100];
                    WordLists: List of [Text];
                    word: Text;
                    RevDesc: Text[100];
                begin
                    Item.SetLoadFields(Description);
                    if Item.FindSet() then begin
                        repeat
                            Clear(Desc);
                            Clear(WordLists);
                            Desc := Item."Description";
                            WordLists := Desc.Split(' ');
                            WordLists.Reverse();
                            foreach word in WordLists do begin
                                RevDesc += word;
                                RevDesc += ' ';
                                Clear(word);
                            end;
                            RevDesc := RevDesc.Trim();
                            Item.Validate("Reversed Description", RevDesc);
                            Item.Modify();
                            Clear(RevDesc);
                        until item.Next() = 0;
                    end;
                end;
            }
        }
    }
}