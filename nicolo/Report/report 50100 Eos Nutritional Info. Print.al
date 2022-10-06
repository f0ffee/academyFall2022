report 50100 "Eos Nutritional Info. Print"
{
    ApplicationArea = All;
    DefaultRenderingLayout = MyDefaultLayout;
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.") { IncludeCaption = true; }
            column(Description; Description) { IncludeCaption = true; }
            column(Picture; Picture) { }
            column(Total_Calories; "Total Calories") { IncludeCaption = true; }
            column(Carbohydrates; Carbohydrates) { }
            column(Proteins; Proteins) { }
            column(Fats; Fats) { }
            column(ShowPicture; ShowPicture) { }


            dataitem("EOS Nutritional Information"; "EOS Nutritional Information")
            {
                DataItemLink = "Item No." = field("No."); //collego le due tabelle, altrimenti mi fa un full outer join

                trigger OnPreDataItem()
                begin
                    Clear(Carbohydrates);
                    Clear(Proteins);
                    Clear(Fats);
                end;

                trigger OnAfterGetRecord()
                begin
                    case "Information Type" of
                        "Information Type"::Carbohydrates:
                            Carbohydrates := Amount;

                        "Information Type"::Proteins:
                            Proteins := Amount;

                        "Information Type"::Fats:
                            Fats := Amount;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if "Total Calories" = 0 then
                    CurrReport.Skip();

                if not ShowPicture then
                    Clear(Picture);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    Caption = 'Options';
                    field(ShowPicture; ShowPicture)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Picture';
                        ToolTip = 'If enabled, shows the picture for the displayed item';

                    }
                }
            }
        }
    }

    rendering
    {
        layout(MyDefaultLayout)
        {
            Type = RDLC;
            LayoutFile = './Source/Report/report 50100 Eos Nutritional Info Print.rdl';
        }
    }


    labels
    {
        ReportTitleLbl = 'Nutritional Informations';
        CarbohydratesLbl = 'Carbohydrates (g)';
        ProteinsLbl = 'Proteins (g)';
        FatsLbl = 'Fats (g)';

    }
    
    trigger OnInitReport()
    begin
        ShowPicture := true;
    end;

    var
        Carbohydrates, Proteins, Fats : Decimal;
        ShowPicture: Boolean;
}