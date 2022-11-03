tableextension 50100 "MyTableExtension" extends Item
{
    fields
    {
        field(50100; "AblaufdatumTableField"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ablauf Datum';
        }

        field(50101; "Description 3"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description 3';
        }
    }
    procedure GetDescriptionLenght() RetValue: Text
    begin
        RetValue := Format(StrLen(Rec."Description 3"));
    end;
}
