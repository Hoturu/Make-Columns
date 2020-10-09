#& make a arbitrary number of columns from data

#& to do
#& make parameters for the options (columns, trailing seperator, quoting)
#& fix the ending, currently adds seperators for empty columns 

#& take command line input filename, columns
#& to pass command line arguments you have to name them ex:
#&  .\Make-Columns.ps1 -columns 3
param (
    [int]$columns = 5,    
    [string]$inputFile = "input.txt", 
    [string]$outputFile = "output.txt" 
)

#& create the array
$input = @()

#& remove the previous default output file
if (Test-path $outputFile){
    remove-item $outputFile    
}

#& populate the array
$input = Get-Content $inputFile

#& set the item number to 0
$item = 0 

#& iterate through the array
while($item -lt $input.Length){

    #& iterate through however many items as we want columns 
    for($count = 0 ; $count -lt $columns ; $count++){

        #& write out to screen for tesing - one item with tab, and no line break
        #write-host ($input[$item], "`t") -NoNewline

        #& Switch on the last line item to prevnet the trailing seperator.
        <#
        $lastItem = $columns - 1
        if ($count -lt $lastItem){
            #& append the output to a line, one item with tab
            $line = $line + $input[$item] + "," #"`t"
        }
        else {
            $line = $line + $input[$item]
        }
        #>

        #& append the output to a line, one item with seperator
        #& use this if you need a trailing seperator 
        $line = $line + """" + $input[$item] + """" + "," #"`t"
        
        #& go to the next item
        $item++


    }
    #&  write out to screen for tesing - blank line
    #Write-Host

    #& write line to file 
    Out-File -filePath $outputFile -Append -inputObject $line
    Write-Host $line


    #& clear line
    $line = ""

}


