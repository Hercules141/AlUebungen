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
    var
        TempExcelBuffer: Record "Excel Buffer";
    begin
        CreateAndFillExcelBuffer(TempExcelBuffer);
    end;

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    local procedure CreateAndFillExcelBuffer(TempExcelBuffer: Record "Excel Buffer" temporary)
    var
        TempBlob: Codeunit "Temp Blob";
        Filemgt: Codeunit "File Management";
        TempOutStream: OutStream;
        TempInStream: InStream;
        Items: Record Item;
        FileMgt: Codeunit "File Management";
        SomeFile: File;
        FileName: Text;
    begin
        FileMgt.CreateFileNameWithExtension('Artefacts', '.exportedexcel');

        TempExcelBuffer.OpenBookStream(TempOutStream, 'TestExport');
        TempExcelBuffer.CloseBook();
        FillExcelBuffer(TempExcelBuffer, Items);
        TempExcelBuffer.SaveToStream(TempOutStream, false);
        TempBlob.CreateOutStream(TempOutStream);
        TempBlob.CreateInStream(TempInStream);

        DownloadFromStream(TempInStream, '', '', '', FileName);
    end;

    local procedure FillExcelBuffer(TempExcelBuffer: Record "Excel Buffer" temporary; Items: Record Item)
    var
        SomeVariant: Variant;
    begin
        TempExcelBuffer.AddColumn(SomeVariant, false, 'First Column', true, false, false, '', TempExcelBuffer."Cell Type");
    end;

    var
        "Item No. Var": Code[20];
}
