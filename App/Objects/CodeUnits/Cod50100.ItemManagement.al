codeunit 50100 "Item Management"
{
    procedure ChangeCase(var itemRect: Record Item)
    begin
        Message('Lowercase: %1', UpperCase(itemRect."Description 3"));
    end;

    procedure SubstituteChar(var ItemTable: Record Item)
    var
        string: Text;
    begin
        string := ItemTable."Description 3";
        string := string.Replace('e', 'o');
        Message('new string %1', string);
    end;

    /// <summary>
    /// Copies Item... Used in trigger of standard dialog (obsolete)
    /// </summary>
    /// <param name="ItemToCopy">for item no</param>
    /// <param name="RecSelected">selection filter set by calling funciton</param>
    // 
    procedure CopyItem(ItemToCopy: Record Item;
                        // RecSonder: Record SonderpreiseTable;
                        RecSelected: Record SonderpreiseTable)
    var
        tempSonderZeile: Record SonderpreiseTable;
    begin


        //init new "line"/Zeile set values and insert
        // tempSonderZeile.copy(RecSelected, true);
        tempSonderZeile.Init();
        // tempSonderZeile := RecSelected;
        tempSonderZeile.TransferFields(RecSelected, false);

        tempSonderZeile.Validate("Item No", ItemToCopy."No.");
        Message('within codeunit tempSonderZeile/ new Entry: %1', Format(tempSonderZeile));
        tempSonderZeile.Insert(true);
    end;

    procedure CopyItem()
    var
        RecItemToCopy: Record Item;
    begin

    end;

    procedure Historise(RecToHistorise: Record SonderpreiseTable)
    var
        HistoryTable: Record SonderPreisHistorie;
    begin
        RecToHistorise.SetAutoCalcFields("Unit Price");
        RecToHistorise.FindSet();

        HistoryTable.Init();
        HistoryTable.TransferFields(RecToHistorise, false);
        HistoryTable.Validate("Entry No. FK", RecToHistorise."Entry No.");
        HistoryTable.Validate("Unit Price", RecToHistorise."Unit Price");

        HistoryTable.Insert(true);
    end;

    // //procedure to copy item into sonderpreistabelle by only giving the raw data
    // procedure CopyItem(RecSonder: Record SonderpreiseTable; ItemNoToCopy: Code[10])
    // var
    //     myInt: Integer;
    // begin

    // end;
}
