report 50101 "Items under 100"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = ;

    dataset
    {
        dataitem(ArtikelDataItem; "Items under 100")
        {

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
                    field("Entry No."; ArtikelDataItem."Entry No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Added on"; ArtikelDataItem."Added On")
                    {
                        ApplicationArea = All;
                    }
                    field("Item No."; ArtikelDataItem."Item No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Item Stock"; ArtikelDataItem."Item Stock")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnPreReport()
    var
    begin
        //Prüfen ob Artikel unter 100 Stück besitzen

    end;

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
}