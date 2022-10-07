report 50100 "EOS Nutritional Info. Print"
{
    ApplicationArea = All;
    Caption = 'Print Nutritional Information';
    DefaultRenderingLayout = DefaultLayout;
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
            column(Protein; Protein) { }
            column(Fats; Fats) { }
            column(ShowPicture; ShowPicture) { }

            dataitem("EOS Nutritional Information";
            "EOS Nutritional Information")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = sorting("Item No.", "Information Type") order(ascending);

                trigger OnPreDataItem()
                begin
                    Clear(Carbohydrates);
                    Clear(Protein);
                    Clear(Fats);
                end;

                trigger OnAfterGetRecord()
                begin
                    case "Information Type" of
                        "Information Type"::Carbohydrates:
                            Carbohydrates := Amount;
                        "Information Type"::Protein:
                            Protein := Amount;
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
                        ToolTip = 'If enabled, shows the picture for the displayed item.';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(DefaultLayout)
        {
            Type = RDLC;
            LayoutFile = './Source/Report/report 50100 EOS Nutritional Info. Print.rdl';
        }
    }

    labels
    {
        ReportTitleLbl = 'Nutritional Information';
        CarbohydratesLbl = 'Carbohydrates (g)';
        ProteinLbl = 'Protein (g)';
        FatsLbl = 'Fats (g)';
    }

    var
        Carbohydrates, Protein, Fats : Decimal;
        ShowPicture: Boolean;

    trigger OnInitReport()
    begin
        ShowPicture := true;
    end;
}