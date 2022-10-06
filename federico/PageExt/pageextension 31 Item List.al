pageextension 50150 "PageExt50101" extends "Item List" //31
{
    layout
    {
        addafter(Description)
        {
            field(ReverseDesc; Rec.ReverseDesc)
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
                Caption = 'Reverse Description';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    Item: Record Item;
                    ListReverse: List of [Text];
                    ReverseString: Text[100];
                    row: Text[100];
                    Datetime1: DateTime;
                    Datetime2: DateTime;
                    Ris: Duration;
                begin
                    Datetime1 := CurrentDateTime();
                    // Item.SetLoadFields(Description);
                    if Item.FindSet() then begin
                        repeat
                            ListReverse := Item.Description.Split(' ');
                            ListReverse.Reverse();
                            foreach row in ListReverse do begin
                                ReverseString += ' ' + row;
                            end;
                            Item.Validate(ReverseDesc, ReverseString);
                            Item.Modify();
                            Clear(ListReverse);
                            Clear(ReverseString);
                        until Item.Next = 0;
                    end;
                    Datetime2 := CurrentDateTime();
                    ris := Datetime2 - Datetime1;
                    Message(Format(ris));
                end;
            }
        }
    }
}