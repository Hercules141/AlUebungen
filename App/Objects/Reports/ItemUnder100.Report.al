report 50101 "Items under 100"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;
    // AllowScheduling = true;
    // DefaultRenderingLayout = ;

    dataset
    {
        dataitem(ItemDataItem; Item)
        {
            trigger OnPreDataItem()
            begin
                ItemDataItem.FindSet();
                ItemDataItem.SetAutoCalcFields(Inventory);
                ItemDataItem.SetFilter(Inventory, '<100');
                // Message('In OnPreDataItem, after find set itemdataitem count: %1', ItemDataItem.count);
            end;

            trigger OnAfterGetRecord()
            var
                ItemsUnder100: Record "Items under 100";
            begin
                // Message('In Onafter get record, dataitemno, inventory: %1, %2', ItemDataItem."No.", ItemDataItem.Inventory);
                // ItemsUnder100.Init();
                ItemsUnder100.Validate("Entry No.", 0);
                ItemsUnder100.Validate("Item No.", "No.");
                ItemsUnder100.Validate("Added On", CurrentDateTime);
                ItemsUnder100.Validate("Item Stock", Inventory);
                ItemsUnder100.Insert;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                // group(GroupName)
                // {
                //     field("Entry No."; ArtikelDataItem."Entry No.")
                //     {
                //         ApplicationArea = All;
                //     }
                //     field("Added on"; ArtikelDataItem."Added On")
                //     {
                //         ApplicationArea = All;
                //     }
                //     field("Item No."; ArtikelDataItem."Item No.")
                //     {
                //         ApplicationArea = All;
                //     }
                //     field("Item Stock"; ArtikelDataItem."Item Stock")
                //     {
                //         ApplicationArea = All;
                //     }
                // }
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

    trigger OnInitReport()
    var
        myInt: Integer;
    begin

    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin

    end;

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