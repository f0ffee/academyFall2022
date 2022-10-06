pageextension 50140 "PageExt50141" extends "Item List" //31
{
    layout
    {
        addafter(Description)
        {

            field("InvertedText"; Rec."InvertedText")
            {
                ApplicationArea = All;
                Editable = false;
            }


        }
    }

    actions
    {
        addlast(Functions)
        {
            action(Inverted)
            {
                ApplicationArea = All;
                Caption = 'Invert';
                trigger OnAction()
                var
                    Item: Record Item;
                    //InvertText: Text[100];
                    WordList: List of [Text];
                    Revdesc, Word : Text[100];

                begin

                    if Item.FindSet() then
                        repeat
                            Clear(WordList);
                            WordList := Item.Description.Split();
                            foreach Word in WordList do
                                Item."InvertedText" := Word + ' ' + Item."InvertedText";
                            Item.Modify();
                        until Item.Next() = 0;
                    CurrPage.Update();
                end;
            }
        }
    }
}