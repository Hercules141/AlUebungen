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
            var
                ItemsUnder100: Record "Items under 100";
            begin

                //empty table to refresh records that may be outdated and to not have duplicates
                //// ItemDataItem.DeleteAll()
                //wrong table...

                //delete correct table this time
                if Dialog.Confirm('do you really want to delete all contents of table: "Items under 100"') then begin
                    ItemsUnder100.DeleteAll();
                end;

                counter := 1;
                ProgressinPercent := 0;
                // ItemDataItem.FindSet(); //not needed here cause it happens automatically when using these triggers to iterate trough data
                ItemDataItem.SetAutoCalcFields(Inventory);
                ItemDataItem.SetFilter(Inventory, '<%1', 100);
                ItemDataItem.SetFilter("No.", '<>%1');
                StatusDialog.Open('Current Record:\' +
                                'Item No.: #1\' +
                                'Item Inventory: #2\' +
                                'Progress: @3');

            end;

            trigger OnAfterGetRecord()
            var
                ItemsUnder100: Record "Items under 100";
            begin
                ItemsUnder100.Validate("Entry No.", 0);     //Necessary for auto increment to work (0 -> "uninitialized")
                ItemsUnder100.Validate("Item No.", "No.");
                ItemsUnder100.Validate("Added On", CurrentDateTime);
                ItemsUnder100.Validate("Item Stock", Inventory);
                ItemsUnder100.Insert;

                //Percent argument of Dialog field using percent Placeholder wants integer whithin range 0-9999, so thats what it gets (+1 for div maybe)
                Evaluate(ProgressinPercent, Format(Round((counter / ItemDataItem.Count) * 10000 + 1) div 1));
                StatusDialog.Update(1, "No.");
                StatusDialog.Update(2, Inventory);
                StatusDialog.Update(3, ProgressinPercent);

                //Conter for current Data Row being inserted starting with 1
                counter += 1;
            end;
        }

        //     dataitem(ItemDataItem; Item)
        //     {
        //         trigger OnPreDataItem()
        //         begin
        //             ItemDataItem.SetAutoCalcFields(Inventory);
        //             ItemDataItem.SetFilter(Inventory, '<100 and'); // todo also filter for 
        //             ItemDataItem.FindSet();

        //             // StatusDialog.Open('Progress?');
        //         end;

        //         // dataitem(ItemUnder100; "Items under 100"){
        //         //     trigger OnPreDataItem()
        //         // DataItemLink = 
        //         //     begin
        //         //         ItemUnder100.FindSet();
        //         //     end;
        //         // }
        //     }
        // }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
            }
        }
    }

    var
        StatusDialog: Dialog;
        counter: Integer;
        ProgressinPercent: Integer;

}
//ignore this change just for testing git
