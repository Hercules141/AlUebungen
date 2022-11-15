xmlport 50100 "Item Info CSV"
{
    Direction = Export; //added
    Format = VariableText; //added
    // FieldDelimiter = '|'; //added
    RecordSeparator = ';\n';
    FieldSeparator = '|'; //added (probably standard)
    FileName = 'ItemInfoCSV.txt';

    schema
    {
        //Node name 1
        textelement(ItemsFile)
        {
            //Node name 2
            //may have to change text element to field element or other
            tableelement(Item; Item)
            {
                RequestFilterHeading = 'Item No'; //only caption
                RequestFilterFields = "No.";

                fieldattribute(Name1; Item."No.")
                {

                }

                fieldelement("ItemNo."; Item."No.")
                {
                }
                fieldelement("ItemDescription"; Item.Description)
                {
                }
                fieldelement("ItemBlocked"; Item.Blocked)
                {
                }
                fieldelement("ItemType"; item.Type)
                {
                }
                fieldelement("ItemBaseUnit"; Item."Base Unit of Measure")
                {
                }
                fieldelement("ItemInventory"; Item.Inventory)
                {
                }
                fieldelement("ItemSalesUnit"; Item."Sales Unit of Measure")
                {
                }
            }
        }

    }

    requestpage
    {
        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            if Item.GetFilters() = '' then
                Error('Item No Filter cannot be empty!');
        end;
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }
    // }
}