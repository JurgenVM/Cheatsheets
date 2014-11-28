foreach($file in (ls .\cheatsheets *.md))
{
$name = $file.BaseName
pandoc .\cheatsheets\$name.md -o .\cheatsheets\pdf\$name.pdf -V geometry:"top=1cm, bottom=1.5cm, left=1cm, right=1cm"
}

foreach($file in (ls .\checklist *.md))
{
$name = $file.BaseName
pandoc .\checklist\$name.md -o .\checklist\pdf\$name.pdf -V geometry:"top=1cm, bottom=1.5cm, left=1cm, right=1cm"
}