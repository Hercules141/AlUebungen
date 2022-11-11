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
        TempExcelBuffer.SetFriendlyFilename('Item Info Excel Export- ' + Format(CurrentDateTime));
        TempExcelBuffer.OpenExcel();

    end;

    local procedure FillExcelBuffer(var TempExcelBuffer: Record "Excel Buffer"; Items: Record Item)
    var
        SomeVariant: Variant;
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Caption 1', false, 'First Column', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Caption 2', false, 'second Column', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Caption 3', false, 'second Column', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    var
        "Item No. Var": Code[20];
}
