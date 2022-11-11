report 50102 "Item Info Excel"
{
    UsageCategory = Lists;

    dataset
    {

        dataitem(ItemDataItem; Item)
        {
            RequestFilterFields = "No.";
            column(ColumnName; "Item No. Var")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            // area(Content)
            // {
            //     field("Item No."; "Item No. var")
            //     {
            //         ApplicationArea = All;
            //         DrillDown = true;
            //         TableRelation = Item."No.";
            //     }
            // }
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

    trigger OnPostReport()
    begin
        CreateAndFillExcelBuffer(ItemDataItem);
    end;

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    local procedure CreateAndFillExcelBuffer(RecItem: Record Item)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
    // TempBlob: Codeunit "Temp Blob";
    // Filemgt: Codeunit "File Management";
    // TempOutStream: OutStream;
    // TempInStream: InStream;
    // Items: Record Item;
    // SomeFile: File;
    // FileName: Text;
    begin
        // FileName := 'FileName';
        // // FileMgt.CreateFileNameWithExtension('Artefacts', '.exportedexcel');

        // TempExcelBuffer.CreateNewBook('sheetname.txt');
        // // TempExcelBuffer.OpenBookStream(TempInStream, 'TestExport');
        // FillExcelBuffer(TempExcelBuffer, Items);
        // TempExcelBuffer.SaveToStream(TempOutStream, false);

        // TempBlob.CreateOutStream(TempOutStream);
        // TempBlob.CreateInStream(TempInStream);

        // TempExcelBuffer.WriteSheet('Header text', CompanyName, UserId);
        // TempExcelBuffer.CloseBook();

        // DownloadFromStream(TempInStream, 'Diaolog Title', '', '', FileName);

        FillExcelBuffer(TempExcelBuffer, RecItem);
        TempExcelBuffer.CreateNewBook('newbook');
        // TempExcelBuffer.AddColumn('Caption 1', false, 'First Column', true, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.WriteSheet('Header Text', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Item Info Excel Export- ' + Format(Today));
        TempExcelBuffer.OpenExcel();

    end;

    local procedure FillExcelBuffer(var TempExcelBuffer: Record "Excel Buffer"; Items: Record Item)
    var
        TempFilter: Text;
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();

        Items.SetAutoCalcFields(Inventory);
        TempFilter := ItemDataItem.GetFilter("No.");
        Items.SetFilter("No.", TempFilter);
        //Create Table Header
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(Items.FieldCaption("No."), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Items.FieldCaption(Description), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Items.FieldCaption(Blocked), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Items.FieldCaption(Type), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Items.FieldCaption("Base Unit of Measure"), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Items.FieldCaption(Inventory), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(Items.FieldCaption("Sales Unit of Measure"), false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);


        if (Items.FindSet()) then
            repeat
            begin
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(Items."No.", false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Items.Description, false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Items.Blocked, false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Items.Type, false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Items."Base Unit of Measure", false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Items.Inventory, false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(Items."Sales Unit of Measure", false, 'A Comment', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
            end;
            until Items.Next() = 0;

    end;

    var
        "Item No. Var": Code[20];
}
